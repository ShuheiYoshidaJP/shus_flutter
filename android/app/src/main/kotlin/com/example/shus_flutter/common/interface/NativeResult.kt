package com.example.shus_flutter.common.`interface`

import java.util.*

interface NativeResult {
    val isSuccess: Boolean
    fun toData(): HashMap<String, Any>
}