package com.example.reverpod_sample.nativebridge

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel

object EventStreamHandler : EventChannel.StreamHandler {
    private var eventSink: EventChannel.EventSink? = null

    fun setup(messenger: BinaryMessenger) {
        EventChannel(messenger, EVENT_CHANNEL).setStreamHandler(this)
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
        TimerDispatcher.setSink(events)
    }

    override fun onCancel(arguments: Any?) {
        TimerDispatcher.clearSink()
    }
}