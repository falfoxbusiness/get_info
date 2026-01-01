import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_info/get_info.dart';

void main() {
  // Initialize Flutter binding
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('get_info');

  setUp(() {
    // Mock the MethodChannel calls
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      if (methodCall.method == 'getPlatformVersion') {
        return 'Android 15';
      } else if (methodCall.method == 'getDeviceInfo') {
        return {
          'brand': 'Google',
          'model': 'Pixel 8',
          'osVersion': 'Android 15',
        };
      }
      return null;
    });
  });

  tearDown(() {
    // Remove the mock after each test
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion returns mocked value', () async {
    final version = await GetInfo.platformVersion;
    expect(version, 'Android 15');
  });

  test('deviceInfo returns mocked map', () async {
    final info = await GetInfo.deviceInfo;
    expect(info, isA<Map<String, dynamic>>());
    expect(info?['brand'], 'Google');
    expect(info?['model'], 'Pixel 8');
    expect(info?['osVersion'], 'Android 15');
  });
}
