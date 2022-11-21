import UIKit
import Flutter
import YandexMapsMobile
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    YMKMapKit.setApiKey("5a832d4a-0dbb-48c4-b91a-7f8c01ba8bde")
    GMSServices.provideAPIKey("AIzaSyAdI30fRaNfNmyv0JPag57fC9O0jXDxknY")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
