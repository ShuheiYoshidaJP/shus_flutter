package com.example.shus_flutter.feature.pose

import com.example.shus_flutter.common.`interface`.NativeError
import java.util.*

enum class PoseError(override val code: Int, override val message: String) : NativeError {

    DETECT(0, "During detecting pose occurred error"),
    IMAGENOTFOUND(1, "UIImage not found"),
    UNEXPEXTED(2, "Unexpected Error");

    override fun toData(): HashMap<String, Any> {
        var result: HashMap<String, Any> = HashMap<String, Any>()
        result.put("result", isSuccess)
        result.put("code", code)
        result.put("message", message)
        return  result
    }
}