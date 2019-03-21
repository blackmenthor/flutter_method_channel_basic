import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    private let CHANNEL: String = "com.anggach.flutternativesample/channel"
    private let METHOD_HELLO: String = "HELLO"
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    setUpMethodChannel()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
  private func setUpMethodChannel() {
    guard let controller: FlutterViewController = window?.rootViewController as? FlutterViewController else {
        fatalError("Invalid root view controller")
    }
    
    let methodChannel = FlutterMethodChannel(name: CHANNEL,
                                             binaryMessenger: controller)
    
    methodChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: FlutterResult) -> Void in
        switch call.method {
        case self.METHOD_HELLO:
            self.hello(call: call, result: result)
            break
        default:
            result(FlutterMethodNotImplemented)
        }
    })
  }
    
    private func hello(call: FlutterMethodCall, result: FlutterResult) {
        result("HELLO WORLD")
    }
    
    
    
}
