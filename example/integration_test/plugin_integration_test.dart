import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:get_info/get_info.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getDevice returns a value', (WidgetTester tester) async {
    final String? device = await GetInfo.getDevice;

    // The value depends on the host platform.
    // We only assert that the call succeeds.
    expect(device, isNotNull);
  });
}
