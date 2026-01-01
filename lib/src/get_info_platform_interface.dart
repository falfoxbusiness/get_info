import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'get_info_method_channel.dart';

abstract class GetInfoPlatform extends PlatformInterface {
  /// Constructs a GetInfoPlatform.
  GetInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static GetInfoPlatform _instance = MethodChannelGetInfo();

  /// The default instance of [GetInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelGetInfo].
  static GetInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GetInfoPlatform] when
  /// they register themselves.
  static set instance(GetInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
