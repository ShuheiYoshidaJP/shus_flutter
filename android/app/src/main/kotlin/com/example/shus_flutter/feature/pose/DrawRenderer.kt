package com.example.shus_flutter.feature.pose

import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import com.google.mlkit.vision.pose.Pose

class DrawRenderer {
    private val circleFillPaint: Paint = Paint()
    private val circleBorderPaint: Paint = Paint()
    private val linePaint: Paint = Paint()
    private val circleRadius: Float = 8f

    constructor() {
        circleBorderPaint.style = Paint.Style.STROKE
        circleBorderPaint.color = Color.BLACK
        circleBorderPaint.strokeWidth = 4f

        circleFillPaint.style = Paint.Style.FILL
        circleFillPaint.color = Color.WHITE
        circleBorderPaint.style = Paint.Style.STROKE

        linePaint.color = Color.argb(255, 148, 209, 106)
        linePaint.strokeWidth = 4f
        linePaint.style = Paint.Style.STROKE
    }

    fun draw(pose: Pose, bitmap: Bitmap): Bitmap {
        val segments = Segment.values()
        val canvas = Canvas(bitmap)
        for (segment in segments) {
            val positions = segment.getLandmark(pose)
            val start = positions.first
            val end = positions.second

            canvas.drawLine(start.position.x, start.position.y, end.position.x, end.position.y, linePaint)
            canvas.drawCircle(start.position.x, start.position.y, circleRadius, circleBorderPaint)
            canvas.drawCircle(end.position.x, end.position.y, circleRadius, circleBorderPaint)
            canvas.drawCircle(start.position.x, start.position.y, circleRadius, circleFillPaint)
            canvas.drawCircle(end.position.x, end.position.y, circleRadius, circleFillPaint)
        }
        return  bitmap
    }
}