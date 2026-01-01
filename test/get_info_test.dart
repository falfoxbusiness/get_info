import 'package:flutter_test/flutter_test.dart';
import 'package:get_info/get_info.dart';
import 'package:get_info/src/get_info_method_channel.dart';
import 'package:get_info/src/get_info_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Mock platform implementation
class MockGetInfoPlatform
    with MockPlatformInterfaceMixin
    implements GetInfoPlatform {

  @override
  Future<String?> getPlatformVersion() async => '42';
}

void main() {
  final GetInfoPlatform initialPlatform = GetInfoPlatform.instance;

  test('Default instance is MethodChannelGetInfo', () {
    expect(initialPlatform, isA<MethodChannelGetInfo>());
  });

  test('getPlatformVersion returns mocked value', () async {
    final getInfoPlugin = GetInfo();
    final fakePlatform = MockGetInfoPlatform();

    // Override the platform instance with the mock
    GetInfoPlatform.instance = fakePlatform;

    final version = await GetInfo.platformVersion;
    expect(version, '42');
  });
}
