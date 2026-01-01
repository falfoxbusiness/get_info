import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get_info/get_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? version,androidVersion,androidVersionCode,id,board,bootloader,brand,
      device,display,fingerprint,hardware,manufacturer,model;
  int? sdkInt;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }


  Future<void> initPlatformState() async {
    try {
      final _version = await GetInfo.androidId;
      final _androidVersion = await GetInfo.androidVersion;
      final _androidVersionCode = await GetInfo.androidVersionCode;
      final _id = await GetInfo.id;
      final _board = await GetInfo.board;
      final _bootloader = await GetInfo.bootloader;
      final _brand = await GetInfo.brand;
      final _device = await GetInfo.device;
      final _display = await GetInfo.display;
      final _fingerprint = await GetInfo.fingerprint;
      final _hardware = await GetInfo.hardware;
      final _manufacturer = await GetInfo.manufacturer;
      final _model = await GetInfo.model;
      final _sdkInt = await GetInfo.sdkVersion;

      if (!mounted) return;

      setState(() {
        version = _version;
        androidVersion = _androidVersion;
        androidVersionCode = _androidVersionCode;
        id = _id;
        board = _board;
        bootloader = _bootloader;
        brand = _brand;
        device = _device;
        display = _display;
        fingerprint = _fingerprint;
        hardware = _hardware;
        manufacturer = _manufacturer;
        model = _model;
        sdkInt = _sdkInt;
      });
    } on PlatformException catch (e) {
      print("Failed to get device info: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Falfox get_info')),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            'android_id: $version\n'
                'androidVersion: $androidVersion\n'
                'androidVersionCode: $androidVersionCode\n'
                'id: $id\n'
                'bootloader: $bootloader\n'
                'brand: $brand\n'
                'board: $board\n'
                'device: $device\n'
                'display: $display\n'
                'fingerprint: $fingerprint\n'
                'hardware: $hardware\n'
                'manufacturer: $manufacturer\n'
                'sdkInt: $sdkInt\n'
                'model: $model\n',
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
