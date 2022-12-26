package com.example.shus_flutter.common.channel

import com.example.shus_flutter.feature.pose.PoseChannel
import com.github.michaelbull.result.mapBoth
import java.util.*

class NativePlugin {
    fun poseDetect(args: Any, completion: (HashMap<String, Any>) -> Unit) {
        val poseChannel = PoseChannel()
        val argument: HashMap<String, Any>? = args as? HashMap<String, Any>?
        poseChannel.poseDetect(argument) { poseResult ->
            poseResult.mapBoth(
                success = { value ->
                    val data = value.toData()
                    completion(data)
                },
                failure = { err ->
                    val data = err.toData()
                    completion(data)
                }
            )
        }
    }
}