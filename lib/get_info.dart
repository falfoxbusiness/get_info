import 'dart:async';
import 'package:flutter/services.dart';

class GetInfo {
  static const MethodChannel _channel = MethodChannel('get_info');

  /// Returns the platform version, e.g., "Android 14"
  static Future<String?> get platformVersion async {
    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  /// Returns a map with device info
  static Future<Map<String, dynamic>?> get deviceInfo async {
    final info = await _channel.invokeMethod<Map>('getDeviceInfo');
    return info?.cast<String, dynamic>();
  }
}
