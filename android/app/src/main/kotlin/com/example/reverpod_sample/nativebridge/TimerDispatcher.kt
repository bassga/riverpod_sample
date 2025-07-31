package com.example.reverpod_sample.nativebridge

import io.flutter.plugin.common.EventChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch
import java.util.Date

object TimerDispatcher {
    private var coroutineScope: CoroutineScope? = null
    private var sendingJob: Job? = null
    private var sink: EventChannel.EventSink? = null

    fun setSink(s: EventChannel.EventSink?) {
        sink = s
    }

    fun clearSink() {
        stop()
        sink = null
    }

    fun start() {
        if (sendingJob != null) return
        coroutineScope = CoroutineScope(Dispatchers.Main)
        sendingJob = coroutineScope?.launch {
            while (isActive) {
                sink?.success("from Android at ${Date()}")
                delay(3000)
            }
        }
    }

    fun stop() {
        sendingJob?.cancel()
        sendingJob = null
        coroutineScope = null
    }
}