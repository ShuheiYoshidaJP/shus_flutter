package com.example.shus_flutter.feature.pose

import android.graphics.Bitmap
import com.example.shus_flutter.common.`interface`.NativeSuccess
import com.example.shus_flutter.common.data.FlutterImage
import com.google.mlkit.vision.pose.Pose
import java.util.*

class PoseSuccess : NativeSuccess {
    private val renderer = DrawRenderer()
    private val flutterImage: FlutterImage

    constructor(pose: Pose, bitmap: Bitmap) {
        val rendered: Bitmap = renderer.draw(pose, bitmap)
        flutterImage = FlutterImage(rendered)
    }

    override val isSuccess: Boolean
        get() = true

    override fun toData(): HashMap<String, Any> {
        var result = HashMap<String, Any>()
        result.put("result", isSuccess)
        result.put("image", flutterImage.toData())
        return result
    }
}