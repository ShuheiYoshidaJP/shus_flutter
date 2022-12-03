package com.example.shus_flutter.feature.pose

enum class PoseError(val code: Int, val message: String) {
    DETECT(0, "During detecting pose occured error"),
    IMAGENOTFOUND(1,"UIImage not found"),
    UNEXPEXTED(2,"Unexpected Error"),
}