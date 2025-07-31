package com.example.reverpod_sample.nativebridge

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

object MethodCallHandler {
    fun setup(messenger: BinaryMessenger) {
        MethodChannel(messenger, METHOD_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "sayHello" -> {
                    val name = call.argument<String>("name") ?: "unknown"
                    result.success("Hello from Android, $name")
                }
                "startTimer" -> {
                    TimerDispatcher.start()
                    result.success(null)
                }
                "stopTimer" -> {
                    TimerDispatcher.stop()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }
}