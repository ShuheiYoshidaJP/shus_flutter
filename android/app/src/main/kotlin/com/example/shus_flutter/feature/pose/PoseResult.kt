package com.example.shus_flutter.feature.pose

class PoseResult {
    // TODO: 12/4/22 Use kotlin-result
    val isSuccess get() = success != null
    var success: PoseSuccess? = null
    var failure: PoseError? = null
}