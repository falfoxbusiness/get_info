import 'package:flutter/material.dart';
import 'package:get_info/get_info.dart';

void main() {
  runApp(const GetInfoExampleApp());
}

class GetInfoExampleApp extends StatelessWidget {
  const GetInfoExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetInfo Example',
      theme: ThemeData(useMaterial3: true),
      home: const DeviceInfoScreen(),
    );
  }
}

class DeviceInfoScreen extends StatefulWidget {
  const DeviceInfoScreen({super.key});

  @override
  State<DeviceInfoScreen> createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  final Map<String, String?> _deviceInfo = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadDeviceInfo();
  }

  Future<void> _loadDeviceInfo() async {
    final info = <String, String?>{
      'Android ID': await GetInfo.getAndroidId,
      'Android Version': await GetInfo.getAndroidVersion,
      'Android Version Code': await GetInfo.getAndroidVersionCode,
      'SDK Version': (await GetInfo.getSdkVersion)?.toString(),
      'Brand': await GetInfo.getBrand,
      'Manufacturer': await GetInfo.getManufacturer,
      'Model': await GetInfo.getModel,
      'Device': await GetInfo.getDevice,
      'Board': await GetInfo.getBoard,
      'Bootloader': await GetInfo.getBootloader,
      'Display': await GetInfo.getDisplay,
      'Fingerprint': await GetInfo.getFingerprintInfo,
      'Hardware': await GetInfo.getHardware,
      'Battery %': (await GetInfo.getBatteryPercentage)?.toString(),
    };

    if (!mounted) return;

    setState(() {
      _deviceInfo
        ..clear()
        ..addAll(info);
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('get_info example'),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _deviceInfo.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final entry = _deviceInfo.entries.elementAt(index);
                return ListTile(
                  title: Text(entry.key),
                  subtitle: Text(entry.value ?? 'Not available'),
                );
              },
            ),
    );
  }
}
