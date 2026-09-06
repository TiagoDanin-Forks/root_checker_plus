import Flutter
import UIKit
import DTTJailbreakDetection

public class RootCheckerPlusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "root_checker_plus", binaryMessenger: registrar.messenger())
    let instance = RootCheckerPlusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isJailbreak":
      result(DTTJailbreakDetection.isJailbroken())
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
