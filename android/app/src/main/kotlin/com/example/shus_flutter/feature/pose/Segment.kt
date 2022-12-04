package com.example.shus_flutter.feature.pose

import android.util.Pair
import com.google.mlkit.vision.pose.Pose
import com.google.mlkit.vision.pose.PoseLandmark

enum class Segment(val points: Pair<Int, Int>) {
    EARS(points = Pair(PoseLandmark.LEFT_EAR, PoseLandmark.RIGHT_EAR)),
    SHOULDERS(points = Pair(PoseLandmark.LEFT_SHOULDER, PoseLandmark.RIGHT_SHOULDER)),
    HIPS(points = Pair(PoseLandmark.LEFT_HIP, PoseLandmark.RIGHT_HIP)),
    LEFTEARNOSE(points = Pair(PoseLandmark.LEFT_EAR, PoseLandmark.NOSE)),
    LEFTSHOULDERELBOW(points = Pair(PoseLandmark.LEFT_SHOULDER, PoseLandmark.LEFT_ELBOW)),
    LEFTELBOWWRIST(points = Pair(PoseLandmark.LEFT_ELBOW, PoseLandmark.LEFT_WRIST)),
    LEFTSHOULDERHIP(points = Pair(PoseLandmark.LEFT_SHOULDER, PoseLandmark.LEFT_HIP)),
    LEFTHIPKNEE(points = Pair(PoseLandmark.LEFT_HIP, PoseLandmark.LEFT_KNEE)),
    LEFTKNEEANKLE(points = Pair(PoseLandmark.LEFT_KNEE, PoseLandmark.LEFT_ANKLE)),
    RIGHTEARNOSE(points = Pair(PoseLandmark.RIGHT_EAR, PoseLandmark.NOSE)),
    RIGHTSHOULDERELBOW(points = Pair(PoseLandmark.RIGHT_SHOULDER, PoseLandmark.RIGHT_ELBOW)),
    RIGHTELBOWWRIST(points = Pair(PoseLandmark.RIGHT_ELBOW, PoseLandmark.RIGHT_WRIST)),
    RIGHTSHOULDERHIP(points = Pair(PoseLandmark.RIGHT_SHOULDER, PoseLandmark.RIGHT_HIP)),
    RIGHTHIPKNEE(points = Pair(PoseLandmark.RIGHT_HIP, PoseLandmark.RIGHT_KNEE)),
    RIGHTKNEEANKLE(points = Pair(PoseLandmark.RIGHT_KNEE, PoseLandmark.RIGHT_ANKLE));

    fun getLandmark(pose: Pose) : Pair<PoseLandmark, PoseLandmark> {
        val start = pose.getPoseLandmark(points.first)
        val end = pose.getPoseLandmark(points.second)
        return Pair(start, end)
    }
}
