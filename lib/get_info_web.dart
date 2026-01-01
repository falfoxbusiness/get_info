import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get_info/src/get_info_platform_interface.dart';
import 'package:web/web.dart' as web;

/// A web implementation of the GetInfoPlatform of the GetInfo plugin.
class GetInfoWeb extends GetInfoPlatform {
  /// Constructs a GetInfoWeb
  GetInfoWeb();

  static void registerWith(Registrar registrar) {
    GetInfoPlatform.instance = GetInfoWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = web.window.navigator.userAgent;
    return version;
  }
}
