package com.example.reverpod_sample

import com.example.reverpod_sample.nativebridge.NativeBridgePlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        NativeBridgePlugin.register(this, flutterEngine.dartExecutor.binaryMessenger)
    }
}