package com.example.shus_flutter.common.channel

import com.example.shus_flutter.feature.pose.PoseChannel
import java.util.*

class NativePlugin {
    fun poseDetect(args: Any, completion: (HashMap<String, Any>) -> Unit) {
        val poseChannel = PoseChannel()
        val argument: HashMap<String, Any>? = args as? HashMap<String, Any>?
        poseChannel.poseDetect(argument) { poseResult ->
            if (poseResult.isSuccess) {
                val data = poseResult.success?.toData()
                completion(data!!)
            } else {
                val data = poseResult.failure?.toData()
                completion(data!!)
            }
        }
    }
}