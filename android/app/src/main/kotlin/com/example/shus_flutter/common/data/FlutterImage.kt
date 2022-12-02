package com.example.shus_flutter.common.data

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import java.util.*

enum class FileType {
    File, Bytes,
}

class FlutterImage() {

    lateinit var type: FileType
    lateinit var image: Bitmap

    constructor(data: HashMap<String, Any>) : this() {
        val typeStr = data["fileType"] as String
        type = when (typeStr) {
            "file" -> FileType.File
            "bytes" -> FileType.Bytes
            else -> throw UnknownError()
        }
        image = when (type) {
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
}

