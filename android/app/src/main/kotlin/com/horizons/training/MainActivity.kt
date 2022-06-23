package com.horizons.training

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Build

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Platform Channel
        val deviceInfoChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "training.horizons.com/deviceinfo")
        deviceInfoChannel.setMethodCallHandler { call, result ->
            if (call.method == "getDeviceInfo") {
                val deviceInfo = getDeviceInfo()
                result.success(deviceInfo)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getDeviceInfo(): String {
        return ("\nDevice: " + Build.DEVICE
                + "\nManufacturer: " + Build.MANUFACTURER
                + "\nModel: " + Build.MODEL
                + "\nProduct: " + Build.PRODUCT
                + "\nVersion Release: " + Build.VERSION.RELEASE
                + "\nVersion SDK: " + Build.VERSION.SDK_INT
                + "\nFingerprint : " + Build.FINGERPRINT)
    }

}
