package com.example.shus_flutter.common.channel

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

class NativeChannel(messenger: BinaryMessenger) {
    private val channel = MethodChannel(messenger, "native-plugin")
    private val plugin = NativePlugin()

    fun setCallHandler() {
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "pose-fn" -> {
                    plugin.poseDetect(call.arguments)
                }
            }
        }
    }
}