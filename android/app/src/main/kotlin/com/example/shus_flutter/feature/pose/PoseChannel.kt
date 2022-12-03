package com.example.shus_flutter.feature.pose

import com.google.mlkit.vision.common.internal.MultiFlavorDetectorCreator
import com.google.mlkit.vision.pose.PoseDetection
import com.google.mlkit.vision.pose.PoseDetector
import com.google.mlkit.vision.pose.accurate.AccuratePoseDetectorOptions
import java.util.*

class PoseChannel {

    var poseDetector: PoseDetector

    init {
        val detectorOptions = AccuratePoseDetectorOptions.Builder()
                .setDetectorMode(AccuratePoseDetectorOptions.SINGLE_IMAGE_MODE)
                .build()
        poseDetector = PoseDetection.getClient(detectorOptions)
    }

    fun poseDetect(args: HashMap<String, Any>?) {
        val input = PoseInput(args)
        val inputImage = input.image?.toInputImage()
    }
}