package com.get_info

import android.bluetooth.BluetoothManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.os.Build
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.location.LocationManager
import android.net.wifi.WifiManager
import android.os.BatteryManager
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
      "ANDROID_ID" -> result.success(getAndroidId(context))
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
      "isLocationEnabled" -> result.success(locationStatus(context))
      "isBluetoothEnabled" -> result.success(bluetoothStatus(context))
      "isDeveloperOptionsEnabled" -> result.success(isDeveloperOptionsEnabled(context))
      "isWifiEnabled" -> result.success(isWifiEnabled(context))
      "openBluetoothSettings" -> openBluetoothSettings(context)
      "openLocationSettings" -> openLocationSettings(context)
      "openWifiSettings" -> openWifiSettings(context)
      "getBatteryPercentage" -> result.success(getBatteryPercentage(context))
      "isBatteryCharging" -> result.success(isBatteryCharging(context))
      else -> result.notImplemented()
    }
  }

  fun getAndroidId(context: Context): String {
    return Settings.Secure.getString(
      context.contentResolver,
      Settings.Secure.ANDROID_ID
    ) ?: ""
  }

  fun locationStatus(context: Context): Boolean {
    val locationManager =
      context.getSystemService(LocationManager::class.java)

    return locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER) ||
            locationManager.isProviderEnabled(LocationManager.NETWORK_PROVIDER)
  }

  fun bluetoothStatus(context: Context): Boolean {
    val bluetoothManager =
      context.getSystemService(BluetoothManager::class.java)

    return bluetoothManager.adapter?.isEnabled == true
  }

  fun openBluetoothSettings(context: Context) {
    val intent = Intent(Settings.ACTION_BLUETOOTH_SETTINGS)
    context.startActivity(intent)
  }

  fun openLocationSettings(context: Context) {
    val intent = Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS)
    context.startActivity(intent)
  }

  fun isDeveloperOptionsEnabled(context: Context): Boolean {
    return Settings.Secure.getInt(
      context.contentResolver,
      Settings.Global.DEVELOPMENT_SETTINGS_ENABLED,
      0
    ) == 1
  }

  fun isWifiEnabled(context: Context): Boolean {
    val wifiManager =
      context.applicationContext.getSystemService(WifiManager::class.java)

    return wifiManager.isWifiEnabled
  }

  fun openWifiSettings(context: Context) {
    val intent = Intent(Settings.ACTION_WIFI_SETTINGS)
    context.startActivity(intent)
  }

  fun getBatteryPercentage(context: Context): Int {
    val intent = context.registerReceiver(
      null,
      IntentFilter(Intent.ACTION_BATTERY_CHANGED)
    )

    val level = intent?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: -1
    val scale = intent?.getIntExtra(BatteryManager.EXTRA_SCALE, -1) ?: -1

    return if (level >= 0 && scale > 0) {
      (level * 100) / scale
    } else {
      -1
    }
  }

  fun isBatteryCharging(context: Context): Boolean {
    val intent = context.registerReceiver(
      null,
      IntentFilter(Intent.ACTION_BATTERY_CHANGED)
    )

    val status = intent?.getIntExtra(BatteryManager.EXTRA_STATUS, -1) ?: -1

    return status == BatteryManager.BATTERY_STATUS_CHARGING ||
            status == BatteryManager.BATTERY_STATUS_FULL
  }


  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
