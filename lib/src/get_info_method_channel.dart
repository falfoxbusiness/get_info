import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'get_info_platform_interface.dart';

/// An implementation of [GetInfoPlatform] that uses method channels.
class MethodChannelGetInfo extends GetInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('get_info');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
