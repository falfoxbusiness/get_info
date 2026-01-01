package com.get_info

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.os.Build
import android.content.Context
import android.provider.Settings

/** GetInfoPlugin */
class GetInfoPlugin: FlutterPlugin, MethodCallHandler {

  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    context = binding.applicationContext
    channel = MethodChannel(binding.binaryMessenger, "get_info")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "ANDROID_VERSION" -> result.success("Android ${Build.VERSION.RELEASE}")
      "ANDROID_VERSION_CODE" -> result.success(Build.VERSION.RELEASE)
      "ANDROID_ID" -> result.success(Settings.Secure.ANDROID_ID)
      "ID" -> result.success(Build.ID)
      "BRAND" -> result.success(Build.BRAND)
      "DEVICE" -> result.success(Build.DEVICE)
      "MODEL" -> result.success(Build.MODEL)
      "BOARD" -> result.success(Build.BOARD)
      "BOOTLOADER" -> result.success(Build.BOOTLOADER)
      "DISPLAY" -> result.success(Build.DISPLAY)
      "FINGERPRINT" -> result.success(Build.FINGERPRINT)
      "HARDWARE" -> result.success(Build.HARDWARE)
      "MANUFACTURER" -> result.success(Build.MANUFACTURER)
      "SDK_INT" -> result.success(Build.VERSION.SDK_INT)
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
