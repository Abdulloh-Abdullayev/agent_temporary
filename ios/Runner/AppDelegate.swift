import UIKit
import Flutter
import YandexMapsMobile

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    YMKMapKit.setApiKey("654ee27b-67b3-44fe-a250-2b8217ea990c")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
