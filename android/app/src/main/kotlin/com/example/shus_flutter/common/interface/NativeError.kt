package com.example.shus_flutter.common.`interface`

interface NativeError: NativeResult {
    val code: Int
    val message: String
    override val isSuccess: Boolean
        get() = false
}