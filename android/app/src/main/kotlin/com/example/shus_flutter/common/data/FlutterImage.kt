package com.example.shus_flutter.common.data

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import com.example.shus_flutter.common.`interface`.NativeInterface
import com.google.mlkit.vision.common.InputImage
import java.io.ByteArrayOutputStream
import java.util.*

class FlutterImage() : NativeInterface {

    lateinit var type: FileType
    lateinit var bitmap: Bitmap

    private val stream = ByteArrayOutputStream()

    enum class FileType {
        File, Bytes,
    }

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

    constructor(bitmap: Bitmap) : this() {
        type = FileType.Bytes
        this.bitmap = bitmap
    }

    fun toInputImage(): InputImage {
        return InputImage.fromBitmap(bitmap, 0)
    }

    override fun toData(): HashMap<String, Any> {
        bitmap.compress(Bitmap.CompressFormat.PNG, 90, stream)
        val byteArray = stream.toByteArray()
        val result = HashMap<String, Any>()
        result.put("data", byteArray)
        return result
    }
}

