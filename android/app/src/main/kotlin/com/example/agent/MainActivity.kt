package com.example.agent

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("654ee27b-67b3-44fe-a250-2b8217ea990c")
        super.configureFlutterEngine(flutterEngine)
    }
}
