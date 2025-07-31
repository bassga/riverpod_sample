package com.example.reverpod_sample.nativebridge

import kotlinx.coroutines.*

import android.app.Activity
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import java.util.Date
import java.util.Timer
import kotlin.concurrent.timer

object NativeBridgePlugin {
    private const val METHOD_CHANNEL = "com.example.native_bridge"
    private const val EVENT_CHANNEL = "com.example/native_event"

    private var eventSink: EventChannel.EventSink? = null

    private var coroutineScope: CoroutineScope? = null
    private var sendingJob: Job? = null

    fun register(activity: Activity, messenger: BinaryMessenger) {
        // MethodChannel: Flutter->Native
        MethodChannel(messenger, METHOD_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "sayHello" -> {
                    val name = call.argument<String>("name") ?: "unknown"
                    result.success("Hello from Android, $name")
                }
                "startTimer" -> {
                    startSending()
                    result.success(null)
                }
                "stopTimer" -> {
                    stopSending()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }

        // EventChannel: Native->Flutter通知
        EventChannel(messenger, EVENT_CHANNEL).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
            }

            override fun onCancel(arguments: Any?) {
                stopSending()
                eventSink = null
            }
        })
    }

    private fun startSending() {
        if (sendingJob != null) return
        coroutineScope = CoroutineScope(Dispatchers.Main)
        sendingJob = coroutineScope?.launch {
            while (isActive) {
                eventSink?.success("from Android at ${Date()}")
                delay(3000)
            }
        }
    }

    private fun stopSending() {
        sendingJob?.cancel()
        sendingJob = null
        coroutineScope = null
    }
}