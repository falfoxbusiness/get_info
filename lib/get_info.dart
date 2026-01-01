import 'dart:async';
import 'package:flutter/services.dart';

class GetInfo {
  static const MethodChannel _channel = MethodChannel('get_info');

  /// Returns the platform version, e.g., "Android 14"
  static Future<String?> get androidVersion async {
    final version = await _channel.invokeMethod<String>('ANDROID_VERSION');
    return version;
  }

  static Future<String?> get androidVersionCode async {
    final version = await _channel.invokeMethod<String>('ANDROID_VERSION_CODE');
    return version;
  }

  static Future<String?> get androidId async {
    final version = await _channel.invokeMethod<String>('ANDROID_ID');
    return version;
  }

  static Future<String?> get id async {
    final version = await _channel.invokeMethod<String>('ID');
    return version;
  }


  static Future<String?> get brand async {
    final version = await _channel.invokeMethod<String>('BRAND');
    return version;
  }

  static Future<String?> get device async {
    final version = await _channel.invokeMethod<String>('DEVICE');
    return version;
  }

  static Future<String?> get model async {
    final version = await _channel.invokeMethod<String>('MODEL');
    return version;
  }

  static Future<String?> get board async {
    final version = await _channel.invokeMethod<String>('BOARD');
    return version;
  }

  static Future<String?> get bootloader async {
    final version = await _channel.invokeMethod<String>('BOOTLOADER');
    return version;
  }

  static Future<String?> get display async {
    final version = await _channel.invokeMethod<String>('DISPLAY');
    return version;
  }

  static Future<String?> get fingerprint async {
    final version = await _channel.invokeMethod<String>('FINGERPRINT');
    return version;
  }

  static Future<String?> get hardware async {
    final version = await _channel.invokeMethod<String>('HARDWARE');
    return version;
  }

  static Future<String?> get manufacturer async {
    final version = await _channel.invokeMethod<String>('MANUFACTURER');
    return version;
  }

  static Future<int?> get sdkVersion async {
    final version = await _channel.invokeMethod<int>('SDK_INT');
    return version;
  }

}
