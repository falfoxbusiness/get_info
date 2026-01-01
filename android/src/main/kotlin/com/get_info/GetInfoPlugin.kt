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
      "getPlatformVersion" -> result.success("Android ${Build.VERSION.RELEASE}")
      "getDeviceInfo" -> {
        val deviceInfo = mapOf(
          "brand" to Build.BRAND,
          "model" to Build.MODEL,
          "device" to Build.DEVICE,
          "id" to Build.ID,
          "androidId" to Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID),
          "versionSdk" to Build.VERSION.SDK_INT
        )
        result.success(deviceInfo)
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
