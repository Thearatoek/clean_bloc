import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let CHANNEL = "com.clean_code/channel"
  private var textField = UITextField()

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let methodChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
    
    secureApplication()
    
    methodChannel.setMethodCallHandler {[weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
     guard let self = self else { return }
     if call.method == "disableScreenshot" {
        self.disableScreenshot()
        result("Screenshot disabled")
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func secureApplication() {
    if !self.window!.subviews.contains(textField) {
      textField.isSecureTextEntry = true
      textField.translatesAutoresizingMaskIntoConstraints = false
      self.window!.addSubview(textField)
      textField.centerYAnchor.constraint(equalTo: self.window!.centerYAnchor).isActive = true
      textField.centerXAnchor.constraint(equalTo: self.window!.centerXAnchor).isActive = true
    }
  }
    private func disableScreenshot() {
    textField.isSecureTextEntry = true
  }
}