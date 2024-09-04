package com.example.bloc_clean_app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.clean_code"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "onInvoke") {
                val response = yourKotlinFunction()
                result.success(response)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun yourKotlinFunction(): String {
        return "Hello from Kotlin!"
    }
}