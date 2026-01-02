# Get Info

A Flutter plugin to get basic platform information.

## Features
- Platform version 

## Usage
Import the get_info package to access device, system, and battery information using simple static APIs.
```dart
import 'package:get_info/get_info.dart';
```

## Platform Support
Currently, **get_info** supports Android.
iOS and Web support will be added in future releases.

Example:
```dart
Future<void> fetchDeviceInfo() async {
final model = await GetInfo.getModel;
final sdkVersion = await GetInfo.getSdkVersion;
final battery = await GetInfo.getBatteryPercentage;

debugPrint('Model: $model');
debugPrint('SDK: $sdkVersion');
debugPrint('Battery: $battery%');
}
```
### Notes
- No plugin initialization is required
- Some features may require Android system permissions
- Methods may return null if the information is unavailable

### Why use get_info?
- Simple static API (no instantiation needed)
- Lightweight alternative to **device_info_plus**
- Includes system status & settings shortcuts
- Production-ready MethodChannel handling

## Important:
### If your app does NOT use Wi-Fi features
To avoid unnecessary permission declarations and Google Play Store rejection, explicitly remove the permission in your app’s 

AndroidManifest.xml:
```xml
<uses-permission
    android:name="android.permission.ACCESS_WIFI_STATE"
    tools:node="remove" />
```
⚠️ This ensures your app declares only the permissions it actually needs, which is required by Google Play policies.

### 📌 Notes
- The plugin does not request runtime permissions
- Permission removal is safe if Wi-Fi APIs are not used
- Recommended for apps targeting Google Play

## Android Support
The plugin fully supports Android and provides access to device information, system status, battery details, and system settings shortcuts.
- All APIs are implemented and production-ready
- No additional setup required beyond standard permissions
- Tested on multiple Android versions

## iOS Support
iOS support is currently under development.
- APIs are not yet implemented on iOS
- Methods may return null or be unavailable
- Full iOS support will be added in a future release

## Platform Compatibility

| Platform | Status |
|---------|--------|
| Android | ✅ Supported |
| iOS | 🚧 In progress |
| Web | 🚧 Coming soon |



