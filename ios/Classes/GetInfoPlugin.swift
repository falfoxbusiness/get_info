import Flutter
import UIKit

public class GetInfoPlugin: NSObject, FlutterPlugin {

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "get_info", binaryMessenger: registrar.messenger())
        let instance = GetInfoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "getDeviceInfo":
            let deviceInfo: [String: Any] = [
                "name": UIDevice.current.name,
                "systemName": UIDevice.current.systemName,
                "systemVersion": UIDevice.current.systemVersion,
                "model": UIDevice.current.model,
                "identifierForVendor": UIDevice.current.identifierForVendor?.uuidString ?? ""
            ]
            result(deviceInfo)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
