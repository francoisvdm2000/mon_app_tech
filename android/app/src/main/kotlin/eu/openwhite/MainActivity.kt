package eu.openwhite.showtechtools

import android.content.Context
import android.content.Intent
import android.provider.Settings
import android.net.wifi.WifiManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private var multicastLock: WifiManager.MulticastLock? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        registerSystemChannel(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "eu.openwhite/multicast")
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "acquire" -> {
                        if (multicastLock == null) {
                            val wifi = applicationContext.getSystemService(Context.WIFI_SERVICE) as WifiManager
                            multicastLock = wifi.createMulticastLock("showtech-multicast").apply {
                                setReferenceCounted(false)
                            }
                        }
                        multicastLock?.acquire()
                        result.success(true)
                    }
                    "release" -> {
                        multicastLock?.let { if (it.isHeld) it.release() }
                        result.success(true)
                    }
                    else -> result.notImplemented()
                }
            }
    }

    private fun registerSystemChannel(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "eu.openwhite/system")
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "openWifiSettings" -> {
                        try {
                            startActivity(Intent(Settings.ACTION_WIFI_SETTINGS)
                                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
                            result.success(true)
                        } catch (e: Exception) {
                            result.success(false)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }

    override fun onDestroy() {
        multicastLock?.let { if (it.isHeld) it.release() }
        super.onDestroy()
    }
}
