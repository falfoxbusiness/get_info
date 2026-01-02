import 'dart:async';
import 'package:flutter/services.dart';

class GetInfo {
  GetInfo._(); // Prevent instantiation

  static const MethodChannel _channel = MethodChannel('get_info');

  /// Generic method invoker with safety
  static Future<T?> _invoke<T>(String method) async {
    try {
      return await _channel.invokeMethod<T>(method);
    } on PlatformException {
      return null;
    }
  }

  // ─────────────────── Device Info ───────────────────

  static Future<String?> get getAndroidVersion =>
      _invoke<String>('ANDROID_VERSION');

  static Future<String?> get getAndroidVersionCode =>
      _invoke<String>('ANDROID_VERSION_CODE');

  static Future<String?> get getAndroidId =>
      _invoke<String>('ANDROID_ID');

  static Future<String?> get getId =>
      _invoke<String>('ID');

  static Future<String?> get getBrand =>
      _invoke<String>('BRAND');

  static Future<String?> get getDevice =>
      _invoke<String>('DEVICE');

  static Future<String?> get getModel =>
      _invoke<String>('MODEL');

  static Future<String?> get getBoard =>
      _invoke<String>('BOARD');

  static Future<String?> get getBootloader =>
      _invoke<String>('BOOTLOADER');

  static Future<String?> get getDisplay =>
      _invoke<String>('DISPLAY');

  static Future<String?> get getFingerprintInfo =>
      _invoke<String>('FINGERPRINT');

  static Future<String?> get getHardware =>
      _invoke<String>('HARDWARE');

  static Future<String?> get getManufacturer =>
      _invoke<String>('MANUFACTURER');

  static Future<int?> get getSdkVersion =>
      _invoke<int>('SDK_INT');

  static Future<int?> get getBatteryPercentage =>
      _invoke<int>('getBatteryPercentage');

  // ─────────────────── System States ───────────────────

  static Future<bool?> get isLocationEnabled =>
      _invoke<bool>('isLocationEnabled');

  static Future<bool?> get isBluetoothEnabled =>
      _invoke<bool>('isBluetoothEnabled');

  static Future<bool?> get isWifiEnabled =>
      _invoke<bool>('isWifiEnabled');

  static Future<bool?> get isDeveloperOptionsEnabled =>
      _invoke<bool>('isDeveloperOptionsEnabled');

  static Future<bool?> get isBatteryCharging =>
      _invoke<bool>('isBatteryCharging');

  // ─────────────────── Open Settings ───────────────────

  static Future<bool?> openBluetoothSettings() =>
      _invoke<bool>('openBluetoothSettings');

  static Future<bool?> openLocationSettings() =>
      _invoke<bool>('openLocationSettings');

  static Future<bool?> openWifiSettings() =>
      _invoke<bool>('openWifiSettings');
}
