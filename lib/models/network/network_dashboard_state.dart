import 'network_device.dart';
import 'dmx_universe.dart';
import 'ndi_source.dart';
import 'network_snapshot.dart';
import 'network_live_alert.dart';

/// Statut du scan réseau dans le dashboard.
enum DashboardScanStatus { idle, scanning, completed, error }

/// État immutable du tableau de bord réseau.
class NetworkDashboardState {
  final DashboardScanStatus scanStatus;
  final String? scanError;
  final int scanProgress; // 0-100

  final List<NetworkDevice> devices;
  final Map<int, DmxUniverse> artnetUniverses;
  final Map<int, DmxUniverse> sacnUniverses;
  final List<NdiSource> ndiSources;

  final int? diagnosticScore; // Tiré du dernier snapshot
  final NetworkSnapshot? lastSnapshot;

  final List<NetworkLiveAlert> liveAlerts;

  final bool artnetListening;
  final bool sacnListening;
  final bool ndiScanning;

  const NetworkDashboardState({
    this.scanStatus = DashboardScanStatus.idle,
    this.scanError,
    this.scanProgress = 0,
    this.devices = const [],
    this.artnetUniverses = const {},
    this.sacnUniverses = const {},
    this.ndiSources = const [],
    this.diagnosticScore,
    this.lastSnapshot,
    this.liveAlerts = const [],
    this.artnetListening = false,
    this.sacnListening = false,
    this.ndiScanning = false,
  });

  NetworkDashboardState copyWith({
    DashboardScanStatus? scanStatus,
    String? scanError,
    int? scanProgress,
    List<NetworkDevice>? devices,
    Map<int, DmxUniverse>? artnetUniverses,
    Map<int, DmxUniverse>? sacnUniverses,
    List<NdiSource>? ndiSources,
    int? diagnosticScore,
    NetworkSnapshot? lastSnapshot,
    List<NetworkLiveAlert>? liveAlerts,
    bool? artnetListening,
    bool? sacnListening,
    bool? ndiScanning,
  }) {
    return NetworkDashboardState(
      scanStatus: scanStatus ?? this.scanStatus,
      scanError: scanError ?? this.scanError,
      scanProgress: scanProgress ?? this.scanProgress,
      devices: devices ?? this.devices,
      artnetUniverses: artnetUniverses ?? this.artnetUniverses,
      sacnUniverses: sacnUniverses ?? this.sacnUniverses,
      ndiSources: ndiSources ?? this.ndiSources,
      diagnosticScore: diagnosticScore ?? this.diagnosticScore,
      lastSnapshot: lastSnapshot ?? this.lastSnapshot,
      liveAlerts: liveAlerts ?? this.liveAlerts,
      artnetListening: artnetListening ?? this.artnetListening,
      sacnListening: sacnListening ?? this.sacnListening,
      ndiScanning: ndiScanning ?? this.ndiScanning,
    );
  }
}
