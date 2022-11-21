package com.example.agent

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("5a832d4a-0dbb-48c4-b91a-7f8c01ba8bde")
        super.configureFlutterEngine(flutterEngine)
    }
}
