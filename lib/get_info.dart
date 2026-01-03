/// A Flutter plugin for retrieving platform-specific device information.
///
/// The `get_info` package provides simple, unified APIs to fetch
/// Android, iOS, and Web device details such as OS version,
/// SDK level, and unique device identifiers.
///
/// This plugin is lightweight and designed for analytics,
/// diagnostics, and platform-aware features.
library;

import 'dart:async';
import 'package:flutter/services.dart';

/// Provides access to platform-specific device information.
///
/// The [GetInfo] class exposes static methods to retrieve
/// device and OS details from Android, iOS, and Web platforms.
///
/// Example:
/// ```dart
/// final androidVersion = await GetInfo.getAndroidVersion();
/// ```
class GetInfo {
  GetInfo._(); // Prevent instantiation

  /// Method channel used to communicate with the native platform.
  ///
  /// All platform-specific calls are routed through this channel.
  static const MethodChannel _channel = MethodChannel('get_info');

  /// Invokes a platform-specific method via the method channel.
  ///
  /// The [method] parameter must match a method name
  /// implemented on the native platform.
  ///
  /// Returns the result cast to type [T], or `null` if
  /// the platform call fails or throws a [PlatformException].
  static Future<T?> _invoke<T>(String method) async {
    try {
      return await _channel.invokeMethod<T>(method);
    } on PlatformException {
      return null;
    }
  }

  // ─────────────────── Device Info ───────────────────

  /// Returns the Android OS version (e.g., `12`, `13`, `14`).
  ///
  /// This is the user-visible Android version running on the device.
  /// Returns `null` if the platform is not Android.
  static Future<String?> get getAndroidVersion =>
      _invoke<String>('ANDROID_VERSION');

  /// Returns the Android OS version code.
  ///
  /// This value represents the internal Android release identifier.
  /// Returns `null` if the platform is not Android.
  static Future<String?> get getAndroidVersionCode =>
      _invoke<String>('ANDROID_VERSION_CODE');

  /// Returns the unique Android ID for the device.
  ///
  /// This ID is generated when the device is first set up
  /// and remains constant for the lifetime of the device.
  /// Returns `null` if unavailable or on non-Android platforms.
  static Future<String?> get getAndroidId => _invoke<String>('ANDROID_ID');

  /// Returns the unique device identifier provided by the platform.
  ///
  /// This may vary based on platform implementation.
  /// Returns `null` if the identifier cannot be retrieved.
  static Future<String?> get getId => _invoke<String>('ID');

  /// Returns the device brand (e.g., `Samsung`, `Google`, `Xiaomi`).
  ///
  /// Useful for analytics and device-specific handling.
  static Future<String?> get getBrand => _invoke<String>('BRAND');

  /// Returns the device name or code name.
  ///
  /// Example: `pixel_7`, `RMX3370`.
  static Future<String?> get getDevice => _invoke<String>('DEVICE');

  /// Returns the device model name.
  ///
  /// Example: `Pixel 7`, `Galaxy S23`.
  static Future<String?> get getModel => _invoke<String>('MODEL');

  /// Returns the device board name.
  ///
  /// This represents the underlying hardware board.
  static Future<String?> get getBoard => _invoke<String>('BOARD');

  /// Returns the device bootloader version.
  ///
  /// This value is mainly used for low-level diagnostics.
  static Future<String?> get getBootloader => _invoke<String>('BOOTLOADER');

  /// Returns the build display identifier.
  ///
  /// This usually includes the build version and release tag.
  static Future<String?> get getDisplay => _invoke<String>('DISPLAY');

  /// Returns the device fingerprint information.
  ///
  /// The fingerprint uniquely identifies the device build
  /// and firmware version.
  static Future<String?> get getFingerprintInfo =>
      _invoke<String>('FINGERPRINT');

  /// Returns the device hardware name.
  ///
  /// Indicates the hardware configuration of the device.
  static Future<String?> get getHardware => _invoke<String>('HARDWARE');

  /// Returns the device manufacturer name.
  ///
  /// Example: `Samsung`, `Google`, `OnePlus`.
  static Future<String?> get getManufacturer => _invoke<String>('MANUFACTURER');

  /// Returns the Android SDK version (API level).
  ///
  /// Example: `33` (Android 13), `34` (Android 14).
  static Future<int?> get getSdkVersion => _invoke<int>('SDK_INT');

  /// Returns the current battery percentage of the device.
  ///
  /// Value ranges from `0` to `100`.
  /// Returns `null` if the battery level cannot be retrieved.
  static Future<int?> get getBatteryPercentage =>
      _invoke<int>('getBatteryPercentage');

  // ─────────────────── System States ───────────────────

  /// Returns `true` if device location services are enabled.
  ///
  /// Indicates whether GPS or network-based location
  /// services are currently active on the device.
  static Future<bool?> get isLocationEnabled =>
      _invoke<bool>('isLocationEnabled');

  /// Returns `true` if Bluetooth is enabled on the device.
  ///
  /// Useful for checking Bluetooth availability before
  /// performing Bluetooth-related operations.
  static Future<bool?> get isBluetoothEnabled =>
      _invoke<bool>('isBluetoothEnabled');

  /// Returns `true` if Wi-Fi is enabled on the device.
  ///
  /// This does not guarantee an active internet connection,
  /// only that Wi-Fi is turned on.
  static Future<bool?> get isWifiEnabled => _invoke<bool>('isWifiEnabled');

  /// Returns `true` if Developer Options are enabled.
  ///
  /// Commonly used for detecting debug or development
  /// environments on Android devices.
  static Future<bool?> get isDeveloperOptionsEnabled =>
      _invoke<bool>('isDeveloperOptionsEnabled');

  /// Returns `true` if the device is currently charging.
  ///
  /// Indicates whether the device is connected to a power
  /// source such as USB or AC charging.
  static Future<bool?> get isBatteryCharging =>
      _invoke<bool>('isBatteryCharging');

  // ─────────────────── Open Settings ───────────────────

  /// Opens the system Bluetooth settings screen.
  ///
  /// Returns `true` if the settings screen was opened successfully.
  /// Returns `false` if the action failed or is not supported.
  static Future<bool?> openBluetoothSettings() =>
      _invoke<bool>('openBluetoothSettings');

  /// Opens the system Location settings screen.
  ///
  /// Allows users to enable or configure location services.
  ///
  /// Returns `true` if the settings screen was opened successfully.
  /// Returns `false` if the action failed or is not supported.
  static Future<bool?> openLocationSettings() =>
      _invoke<bool>('openLocationSettings');

  /// Opens the system Wi-Fi settings screen.
  ///
  /// Useful for prompting users to enable or change
  /// Wi-Fi network connections.
  ///
  /// Returns `true` if the settings screen was opened successfully.
  /// Returns `false` if the action failed or is not supported.
  static Future<bool?> openWifiSettings() => _invoke<bool>('openWifiSettings');
}
