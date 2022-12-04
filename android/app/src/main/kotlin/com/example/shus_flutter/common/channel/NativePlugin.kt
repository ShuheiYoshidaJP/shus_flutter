package com.example.shus_flutter.common.channel

import com.example.shus_flutter.feature.pose.PoseChannel
import java.util.*

class NativePlugin {
    fun poseDetect(args: Any) {
        val poseChannel = PoseChannel()
        val argument: HashMap<String, Any>? = args as? HashMap<String, Any>?
        poseChannel.poseDetect(argument)
    }
}