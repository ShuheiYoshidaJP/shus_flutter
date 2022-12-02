package com.example.shus_flutter.feature.pose

import com.example.shus_flutter.common.data.FlutterImage
import java.util.*

class PoseInput {
    var height: Double? = data["height"]
    var image: FlutterImage? = null

    constructor(data: HashMap<String, Any>){
        val imageData = data["image"]
         if (imageData is HashMap<*, *>) {
             image = FlutterImage(imageData)
         }
    }
}
