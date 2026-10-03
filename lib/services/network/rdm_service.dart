import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../models/network/art_rdm_packets.dart';
import '../../models/network/rdm_device.dart';
import '../../models/network/rdm_message.dart';
import '../../models/network/rdm_uid.dart';
import 'network_target_config.dart';

/// Service de découverte et de lecture/écriture RDM par-dessus Art-Net
/// (ArtTod + ArtRdm), en s'appuyant sur la cible réseau partagée
/// ([networkTargetConfig]) déjà utilisée par la console virtuelle : mêmes
/// univers, même IP cible.
///
/// Le vrai RDM (ANSI E1.20) est un protocole bidirectionnel sur ligne
/// RS-485 — ça ne circule en réseau que si un node (Luminex, Pathport, une
/// passerelle ETC...) proxy le RDM au-dessus de son interface Art-Net. Un
/// node purement grand public qui ne fait qu'émettre du DMX ne répondra
/// simplement jamais à un ArtTodRequest, ce qui se traduira ici par "aucune
/// fixture trouvée" plutôt qu'une erreur.
///
/// Toutes les requêtes GET/SET sont sérialisées une par une (pas de
/// parallélisme) : RDM est un protocole lent, demi-duplex, et un node n'a
/// souvent qu'une seule ligne RDM réelle par univers — envoyer plusieurs
/// requêtes en même temps ne ferait que les faire entrer en collision.
class RdmService extends ChangeNotifier {
  RdmService._();
  static final RdmService instance = RdmService._();

  static const int kArtNetPort = 6454;
  static const Duration _kResponseTimeout = Duration(milliseconds: 1500);
  static const Duration _kDiscoveryWindow = Duration(milliseconds: 2500);

  RawDatagramSocket? _socket;
  bool _running = false;
  bool get isRunning => _running;

  bool _isScanning = false;
  bool get isScanning => _isScanning;

  String? lastError;

  final Map<String, RdmDevice> _devices = {};
  List<RdmDevice> get devices => _devices.values.toList()
    ..sort((a, b) => a.uid.label.compareTo(b.uid.label));

  int _transactionNumber = 0;
  final Map<int, Completer<RdmMessage?>> _pending = {};

  /// UIDs vus pendant la fenêtre de découverte en cours, avec l'univers sur
  /// lequel chacun a répondu (un ArtTodData donne un univers par paquet —
  /// on le garde pour ne pas retomber bêtement sur l'univers de départ).
  Map<RdmUid, int>? _discoveryCollector;

  /// File d'attente simple : chaque opération attend la fin de la
  /// précédente avant de démarrer.
  Future<void> _queue = Future<void>.value();

  Future<T> _enqueue<T>(Future<T> Function() action) {
    final result = _queue.then((_) => action());
    _queue = result.then((_) {}, onError: (_) {});
    return result;
  }

  // ── Cycle de vie ────────────────────────────────────────────────────────

  Future<void> start() async {
    if (_running) return;
    lastError = null;
    try {
      _socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        kArtNetPort,
        reuseAddress: true,
        reusePort: true,
      );
      _socket!.broadcastEnabled = true;
      _running = true;

      _socket!.listen(
        (event) {
          if (event == RawSocketEvent.read) {
            final datagram = _socket?.receive();
            if (datagram != null) _handleDatagram(datagram.data);
          }
        },
        onDone: () => _running = false,
        onError: (_) => _running = false,
        cancelOnError: false,
      );
      notifyListeners();
    } catch (e) {
      _running = false;
      lastError = e.toString();
      _socket?.close();
      _socket = null;
      notifyListeners();
      rethrow;
    }
  }

  void stop() {
    _running = false;
    _socket?.close();
    _socket = null;
    for (final c in _pending.values) {
      if (!c.isCompleted) c.complete(null);
    }
    _pending.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  int _nextTransactionNumber() {
    _transactionNumber = (_transactionNumber + 1) & 0xFF;
    return _transactionNumber;
  }

  // ── Réception ────────────────────────────────────────────────────────────

  void _handleDatagram(List<int> data) {
    // ArtTodData : accumulation pendant une fenêtre de découverte.
    final tod = ArtTodDataPacket.parse(data);
    if (tod != null) {
      final collector = _discoveryCollector;
      if (collector != null) {
        for (final uid in tod.uids) {
          collector[uid] = tod.universe;
        }
      }
      return;
    }

    // ArtRdm : réponse à une requête GET/SET en attente.
    final parsedRdm = parseArtRdm(data);
    if (parsedRdm == null) return;
    final message = RdmMessage.decode(parsedRdm.rdmData);
    if (message == null) return;
    if (message.destUid != RdmUid.controller) return;

    final completer = _pending.remove(message.transactionNumber);
    if (completer != null && !completer.isCompleted) {
      completer.complete(message);
    }
  }

  // ── Requêtes RDM bas niveau ──────────────────────────────────────────────

  Future<RdmMessage?> _sendAndWait({
    required int universe,
    required RdmUid destUid,
    required int commandClass,
    required int pid,
    int subDevice = 0,
    List<int> data = const [],
  }) async {
    final socket = _socket;
    final target = networkTargetConfig.resolvedTarget;
    if (socket == null || target == null) return null;

    final tn = _nextTransactionNumber();
    final message = RdmMessage(
      destUid: destUid,
      sourceUid: RdmUid.controller,
      transactionNumber: tn,
      portIdOrResponseType: 0x01, // Port ID (côté requête)
      messageCount: 0,
      subDevice: subDevice,
      commandClass: commandClass,
      pid: pid,
      data: data,
    );

    final completer = Completer<RdmMessage?>();
    _pending[tn] = completer;

    try {
      final packet = buildArtRdm(universe, message.encode());
      socket.send(packet, target, kArtNetPort);
      return await completer.future.timeout(
        _kResponseTimeout,
        onTimeout: () => null,
      );
    } finally {
      _pending.remove(tn);
    }
  }

  Future<RdmMessage?> _get(int universe, RdmUid uid, int pid) => _sendAndWait(
        universe: universe,
        destUid: uid,
        commandClass: RdmCommandClass.getCommand,
        pid: pid,
      );

  Future<RdmMessage?> _set(int universe, RdmUid uid, int pid, List<int> data) =>
      _sendAndWait(
        universe: universe,
        destUid: uid,
        commandClass: RdmCommandClass.setCommand,
        pid: pid,
        data: data,
      );

  bool _isAck(RdmMessage? response, int expectedCommandClass) {
    return response != null &&
        response.commandClass == expectedCommandClass &&
        response.portIdOrResponseType == RdmResponseType.ack;
  }

  // ── Découverte ───────────────────────────────────────────────────────────

  /// Lance une recherche ArtTod sur tous les univers actuellement ciblés
  /// (`networkTargetConfig.universes`), puis récupère les infos de base de
  /// chaque nouvelle fixture trouvée (footprint, adresse DMX, personality,
  /// libellé, fabricant).
  Future<void> scan() async {
    if (!_running) {
      lastError = 'RDM service not started';
      notifyListeners();
      return;
    }
    final target = networkTargetConfig.resolvedTarget;
    final socket = _socket;
    if (target == null || socket == null) {
      lastError = 'No network target resolved';
      notifyListeners();
      return;
    }

    _isScanning = true;
    lastError = null;
    notifyListeners();

    final collector = <RdmUid, int>{};
    _discoveryCollector = collector;

    try {
      for (final universe in networkTargetConfig.universes) {
        socket.send(buildArtTodRequest(universe), target, kArtNetPort);
      }
      await Future.delayed(_kDiscoveryWindow);
    } finally {
      _discoveryCollector = null;
    }

    // Chaque UID garde l'univers sur lequel il a effectivement répondu
    // (utile dès qu'on scanne plusieurs univers à la fois).
    final now = DateTime.now();
    for (final entry in collector.entries) {
      final uid = entry.key;
      final universe = entry.value;
      final key = uid.label;
      final existing = _devices[key];
      _devices[key] = (existing ?? RdmDevice(uid: uid, universe: universe, lastSeen: now))
          .copyWith(universe: universe, lastSeen: now);
    }

    _isScanning = false;
    notifyListeners();

    // Récupère les détails de chaque device séquentiellement (la file
    // d'attente interne garantit qu'on ne bombarde pas plusieurs requêtes
    // en même temps).
    for (final uid in collector.keys) {
      await refreshDevice(uid);
    }
  }

  /// Relit les infos de base d'une fixture déjà découverte (footprint,
  /// adresse DMX, personality, libellés).
  Future<void> refreshDevice(RdmUid uid) => _enqueue(() async {
        final key = uid.label;
        final device = _devices[key];
        if (device == null) return;

        _devices[key] = device.copyWith(isLoadingDetails: true, clearError: true);
        notifyListeners();

        final universe = device.universe;
        String? error;

        try {
          final infoResp = await _get(universe, uid, RdmPid.deviceInfo);
          RdmDeviceInfo? info;
          if (_isAck(infoResp, RdmCommandClass.getCommandResponse)) {
            info = RdmDeviceInfo.parse(infoResp!.data);
          }

          final labelResp = await _get(universe, uid, RdmPid.deviceLabel);
          String? label;
          if (_isAck(labelResp, RdmCommandClass.getCommandResponse)) {
            label = decodeRdmAscii(labelResp!.data);
          }

          final manufacturerResp = await _get(universe, uid, RdmPid.manufacturerLabel);
          String? manufacturer;
          if (_isAck(manufacturerResp, RdmCommandClass.getCommandResponse)) {
            manufacturer = decodeRdmAscii(manufacturerResp!.data);
          }

          final swResp = await _get(universe, uid, RdmPid.softwareVersionLabel);
          String? sw;
          if (_isAck(swResp, RdmCommandClass.getCommandResponse)) {
            sw = decodeRdmAscii(swResp!.data);
          }

          if (info == null && label == null && manufacturer == null && sw == null) {
            error = 'no_response';
          }

          final current = _devices[key];
          if (current == null) return;
          _devices[key] = current.copyWith(
            isLoadingDetails: false,
            dmxFootprint: info?.dmxFootprint,
            dmxStartAddress: info?.dmxStartAddress,
            personalityCurrent: info?.personalityCurrent,
            personalityCount: info?.personalityCount,
            deviceLabel: label,
            manufacturerLabel: manufacturer,
            softwareVersionLabel: sw,
            error: error,
            clearError: error == null,
          );
        } catch (e) {
          final current = _devices[key];
          if (current != null) {
            _devices[key] =
                current.copyWith(isLoadingDetails: false, error: e.toString());
          }
        }
        notifyListeners();
      });

  // ── Modifications (SET) ──────────────────────────────────────────────────
  //
  // Chaque SET renvoie true/false selon que la fixture a ACK. Le garde-fou
  // de confirmation utilisateur ("es-tu sûr ?") vit côté UI (rdm_page.dart),
  // pas ici : ce service exécute ce qu'on lui demande sans redemander.

  Future<bool> setStartAddress(RdmUid uid, int value) => _enqueue(() async {
        final device = _devices[uid.label];
        if (device == null) return false;
        _setApplying(uid, true);
        final clamped = value.clamp(1, 512);
        final resp = await _set(
          device.universe,
          uid,
          RdmPid.dmxStartAddress,
          [(clamped >> 8) & 0xFF, clamped & 0xFF],
        );
        final ok = _isAck(resp, RdmCommandClass.setCommandResponse);
        _setApplying(uid, false);
        if (ok) await refreshDevice(uid);
        return ok;
      });

  Future<bool> setPersonality(RdmUid uid, int value) => _enqueue(() async {
        final device = _devices[uid.label];
        if (device == null) return false;
        _setApplying(uid, true);
        final resp = await _set(
          device.universe,
          uid,
          RdmPid.dmxPersonality,
          [value & 0xFF],
        );
        final ok = _isAck(resp, RdmCommandClass.setCommandResponse);
        _setApplying(uid, false);
        if (ok) await refreshDevice(uid);
        return ok;
      });

  Future<bool> setDeviceLabel(RdmUid uid, String label) => _enqueue(() async {
        final device = _devices[uid.label];
        if (device == null) return false;
        _setApplying(uid, true);
        // RDM DEVICE_LABEL est un champ ASCII : on protège contre un
        // caractère accentué/non-ASCII qui ferait planter la construction
        // du Uint8List (code unit > 255) en le ramenant dans l'octet.
        final bytes = label.codeUnits.map((c) => c & 0xFF).take(32).toList();
        final resp = await _set(device.universe, uid, RdmPid.deviceLabel, bytes);
        final ok = _isAck(resp, RdmCommandClass.setCommandResponse);
        _setApplying(uid, false);
        if (ok) await refreshDevice(uid);
        return ok;
      });

  Future<bool> setIdentify(RdmUid uid, bool on) => _enqueue(() async {
        final device = _devices[uid.label];
        if (device == null) return false;
        _setApplying(uid, true);
        final resp = await _set(
          device.universe,
          uid,
          RdmPid.identifyDevice,
          [on ? 0x01 : 0x00],
        );
        final ok = _isAck(resp, RdmCommandClass.setCommandResponse);
        _setApplying(uid, false);
        final current = _devices[uid.label];
        if (ok && current != null) {
          _devices[uid.label] = current.copyWith(identifyOn: on);
        }
        notifyListeners();
        return ok;
      });

  void _setApplying(RdmUid uid, bool applying) {
    final current = _devices[uid.label];
    if (current == null) return;
    _devices[uid.label] = current.copyWith(isApplyingChange: applying);
    notifyListeners();
  }
}

/// Accès global, même convention que `dmxSenderService` / `patchStore`.
final RdmService rdmService = RdmService.instance;
