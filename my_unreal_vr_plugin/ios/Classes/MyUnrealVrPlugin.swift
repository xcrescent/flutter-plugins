import Flutter
import UIKit

public class MyUnrealVrPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "my_unreal_vr_plugin", binaryMessenger: registrar.messenger())
    let instance = MyUnrealVrPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "startVR":
        startVR()
        result(nil)
      case "stopVR":
        stopVR()
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
    }
    // result("iOS " + UIDevice.current.systemVersion)
  }
  private func startVR() {
    // Call the appropriate native method to start the Unreal Engine VR environment.
  }
  
  private func stopVR() {
    // Call the appropriate native method to stop the Unreal Engine VR environment.
  }
}
