package com.example.shus_flutter.common.data

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import com.google.mlkit.vision.common.InputImage
import java.util.*

enum class FileType {
    File, Bytes,
}

class FlutterImage() {

    lateinit var type: FileType
    lateinit var bitmap: Bitmap

    constructor(data: HashMap<String, Any>) : this() {
        val typeStr = data["fileType"] as String
        type = when (typeStr) {
            "file" -> FileType.File
            "bytes" -> FileType.Bytes
            else -> throw UnknownError()
        }
        bitmap = when (type) {
            FileType.File -> {
                val filePath = data["path"] as String
//                val imgFile = File(filePath)
                BitmapFactory.decodeFile(filePath)
            }
            FileType.Bytes -> {
                val content = data["content"] as ByteArray
                BitmapFactory.decodeByteArray(content, 0, content.size)
            }
        }
    }

    fun toInputImage(): InputImage {
        return InputImage.fromBitmap(bitmap, 0)
    }
}

