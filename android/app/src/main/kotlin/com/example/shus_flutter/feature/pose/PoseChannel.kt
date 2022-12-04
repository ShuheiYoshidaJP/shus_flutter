package com.example.shus_flutter.feature.pose

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

    fun poseDetect(args: HashMap<String, Any>?, callback: (PoseResult) -> Void) {
        // TODO: 12/3/22 Use kotlin-result
        val input = PoseInput(args)
        val flutterImage = input.image
        val result = PoseResult()

        if (flutterImage == null) {
            val error = PoseError.IMAGENOTFOUND
            result.failure = error
            callback(result)
        } else {
            val inputImage = flutterImage.toInputImage()
            poseDetector.process(inputImage)
                    .addOnSuccessListener { pose ->
                        val success = PoseSuccess(pose, flutterImage.bitmap)
                        result.success = success
                        callback(result)
                    }
                    .addOnFailureListener {
                        val error = PoseError.DETECT
                        result.failure = error
                        callback(result)
                    }
        }
    }
}