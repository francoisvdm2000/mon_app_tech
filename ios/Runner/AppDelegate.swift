import Flutter
import Darwin
import UIKit
import FBSDKCoreKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    ApplicationDelegate.shared.application(
      application,
      didFinishLaunchingWithOptions: launchOptions
    )
    GeneratedPluginRegistrant.register(with: self)

    // Ping ICMP natif (outil Réseau › Ping)
    if let registrar = self.registrar(forPlugin: "OpenWhitePing") {
      let channel = FlutterMethodChannel(
        name: "eu.openwhite/ping", binaryMessenger: registrar.messenger())
      channel.setMethodCallHandler { call, result in
        guard call.method == "ping",
              let args = call.arguments as? [String: Any],
              let ip = args["ip"] as? String else {
          result(FlutterMethodNotImplemented); return
        }
        let timeout = args["timeoutMs"] as? Int ?? 1000
        let seq = UInt16(truncatingIfNeeded: args["seq"] as? Int ?? 0)
        DispatchQueue.global(qos: .userInitiated).async {
          let ms = IcmpPinger.ping(ip: ip, timeoutMs: timeout, seq: seq)
          DispatchQueue.main.async { result(ms) }
        }
      }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey: Any] = [:]
  ) -> Bool {
    ApplicationDelegate.shared.application(app, open: url, options: options)
  }
}

// MARK: - Ping ICMP


/// Ping ICMP sans privilèges (socket SOCK_DGRAM / IPPROTO_ICMP),
/// méthode autorisée par Apple sur iOS (cf. exemple SimplePing).
enum IcmpPinger {
  private static let identifier = UInt16(truncatingIfNeeded: getpid())

  /// Retourne la latence en ms, ou nil si pas de réponse dans le délai.
  static func ping(ip: String, timeoutMs: Int, seq: UInt16) -> Double? {
    var dest = sockaddr_in()
    dest.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
    dest.sin_family = sa_family_t(AF_INET)
    guard inet_pton(AF_INET, ip, &dest.sin_addr) == 1 else { return nil }

    let fd = socket(AF_INET, SOCK_DGRAM, IPPROTO_ICMP)
    guard fd >= 0 else { return nil }
    defer { close(fd) }

    // Paquet ICMP Echo Request : type 8, code 0, checksum, id, seq + 56 o.
    var packet = [UInt8](repeating: 0, count: 8 + 56)
    packet[0] = 8
    packet[4] = UInt8(identifier >> 8); packet[5] = UInt8(identifier & 0xFF)
    packet[6] = UInt8(seq >> 8);        packet[7] = UInt8(seq & 0xFF)
    for i in 8..<packet.count { packet[i] = UInt8(truncatingIfNeeded: i) }
    let cs = checksum(packet)
    packet[2] = UInt8(cs >> 8); packet[3] = UInt8(cs & 0xFF)

    let packetSize = packet.count
    let start = DispatchTime.now().uptimeNanoseconds
    let sent = withUnsafePointer(to: &dest) { ptr -> Int in
      ptr.withMemoryRebound(to: sockaddr.self, capacity: 1) {
        sendto(fd, packet, packetSize, 0, $0, socklen_t(MemoryLayout<sockaddr_in>.size))
      }
    }
    guard sent == packet.count else { return nil }

    let deadline = start + UInt64(timeoutMs) * 1_000_000
    var buf = [UInt8](repeating: 0, count: 1500)
    let bufSize = buf.count
    while true {
      let now = DispatchTime.now().uptimeNanoseconds
      if now >= deadline { return nil }
      var pfd = pollfd(fd: fd, events: Int16(POLLIN), revents: 0)
      let remaining = Int32((deadline - now) / 1_000_000) + 1
      let pr = poll(&pfd, 1, remaining)
      if pr <= 0 { return nil }

      var from = sockaddr_in()
      var fromLen = socklen_t(MemoryLayout<sockaddr_in>.size)
      let n = withUnsafeMutablePointer(to: &from) { ptr -> Int in
        ptr.withMemoryRebound(to: sockaddr.self, capacity: 1) {
          recvfrom(fd, &buf, bufSize, 0, $0, &fromLen)
        }
      }
      if n <= 0 { continue }
      // Sur Darwin la réponse contient l'en-tête IP.
      var off = 0
      if n >= 20 && (buf[0] >> 4) == 4 { off = Int(buf[0] & 0x0F) * 4 }
      guard n >= off + 8 else { continue }
      let type = buf[off]
      let rseq = (UInt16(buf[off + 6]) << 8) | UInt16(buf[off + 7])
      if type == 0 && rseq == seq && from.sin_addr.s_addr == dest.sin_addr.s_addr {
        let end = DispatchTime.now().uptimeNanoseconds
        return Double(end - start) / 1_000_000.0
      }
    }
  }

  private static func checksum(_ data: [UInt8]) -> UInt16 {
    var sum: UInt32 = 0
    var i = 0
    while i + 1 < data.count {
      sum += (UInt32(data[i]) << 8) | UInt32(data[i + 1])
      i += 2
    }
    if i < data.count { sum += UInt32(data[i]) << 8 }
    while sum >> 16 != 0 { sum = (sum & 0xFFFF) + (sum >> 16) }
    return ~UInt16(sum & 0xFFFF)
  }
}
