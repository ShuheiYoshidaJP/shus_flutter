package com.example.shus_flutter.feature.pose

import com.example.shus_flutter.common.data.FlutterImage
import java.util.*

class PoseInput {
    var height: Double? = null
    var image: FlutterImage? = null

    constructor(data: HashMap<String, Any>?) {
        if (data == null) return
        height = data["height"] as Double?
        val imageData: HashMap<String, Any>? = data["image"] as? HashMap<String, Any>?
        if (imageData != null) {
            image =  FlutterImage(imageData)
        }
    }
}
