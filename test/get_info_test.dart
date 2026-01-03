import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_info/get_info.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('get_info');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall call) async {
      switch (call.method) {
        case 'isWifiEnabled':
          return true;
        case 'isBluetoothEnabled':
          return false;
      }
      return null;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('isWifiEnabled returns mocked value', () async {
    final result = await GetInfo.isWifiEnabled;
    expect(result, true);
  });

  test('isBluetoothEnabled returns mocked value', () async {
    final result = await GetInfo.isBluetoothEnabled;
    expect(result, false);
  });
}
