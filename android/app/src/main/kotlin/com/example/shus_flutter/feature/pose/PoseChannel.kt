package com.example.shus_flutter.feature.pose

import android.graphics.Bitmap
import com.github.michaelbull.result.*
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

    fun poseDetect(args: HashMap<String, Any>?, completion: (Result<PoseSuccess, PoseError>) -> Unit) {
        val input = PoseInput(args)
        val flutterImage = input.image

        if (flutterImage == null) {
            val error = PoseError.IMAGENOTFOUND
            completion(Err(error))
        } else {
            val inputImage = flutterImage.toInputImage()
            val renderedImage = flutterImage.bitmap.copy(Bitmap.Config.ARGB_8888, true)
            poseDetector.process(inputImage)
                .addOnSuccessListener { pose ->
                    val success = PoseSuccess(pose, renderedImage)
                    completion(Ok(success))
                }
                .addOnFailureListener {
                    val error = PoseError.DETECT
                    completion(Err(error))
                }
        }
    }
}