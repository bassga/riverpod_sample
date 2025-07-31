package com.example.reverpod_sample.nativebridge

import kotlinx.coroutines.*

import android.app.Activity
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import java.util.Date

object NativeBridgePlugin {

    private var eventSink: EventChannel.EventSink? = null

    private var coroutineScope: CoroutineScope? = null
    private var sendingJob: Job? = null

    fun register(activity: Activity, messenger: BinaryMessenger) {
        MethodCallHandler.setup(messenger)
        EventStreamHandler.setup(messenger)
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