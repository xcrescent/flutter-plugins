package com.example.my_unreal_vr_plugin

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** MyUnrealVrPlugin */
class MyUnrealVrPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val channel = MethodChannel(flutterPluginBinding.getBinaryMessenger(), "my_unreal_vr_plugin")
    channel.setMethodCallHandler(MyUnrealVrPlugin())
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "initialize" -> {
        // Initialize the Unreal Engine VR environment
        val context = channel.flutterEngine?.context ?: return
        CoroutineScope(Dispatchers.IO).launch {
          try {
            initializeUnrealEngineVR(context)
            result.success(true)
          } catch (e: Exception) {
            Log.e(TAG, "Error initializing Unreal Engine VR", e)
            result.error("INIT_ERROR", "Error initializing Unreal Engine VR", null)
          }
        }
      }
      "startVR" -> {
        // Call the appropriate method to start the VR environment
        CoroutineScope(Dispatchers.IO).launch {
          try {
            startUnrealEngineVR()
            result.success(true)
          } catch (e: Exception) {
            Log.e(TAG, "Error starting Unreal Engine VR", e)
            result.error("START_ERROR", "Error starting Unreal Engine VR", null)
          }
        }
      }
      "stopVR" -> {
        // Call the appropriate method to stop the VR environment
        CoroutineScope(Dispatchers.IO).launch {
          try {
            stopUnrealEngineVR()
            result.success(true)
          } catch (e: Exception) {
            Log.e(TAG, "Error stopping Unreal Engine VR", e)
            result.error("STOP_ERROR", "Error stopping Unreal Engine VR", null)
          }
        }
      }
      "sendInput" -> {
        val input: String = call.arguments()
        // Call the appropriate method to send input to the VR environment
        sendInput(input);
        result.success(null)
      }
      else -> result.notImplemented()
    }
//    if (call.method == "getPlatformVersion") {
//      result.success("Android ${android.os.Build.VERSION.RELEASE}")
//    } else {
//      result.notImplemented()
//    }
  }
  companion object {
    private const val TAG = "UnrealEngineVRPlugin"
  }

  private external fun initializeUnrealEngineVR(context: Context)
  private external fun startUnrealEngineVR()
  private external fun stopUnrealEngineVR()
  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
//    methodChannel.setMethodCallHandler(null);
    channel = null;
    flutterView = null;
  }
  private fun startVR() {
    // Call the necessary Unreal Engine VR methods to start the VR environment
  }

  private fun stopVR() {
    // Call the necessary Unreal Engine VR methods to stop the VR environment
  }
  private fun sendInput(String input) {
    // Call the necessary Unreal Engine VR methods to send input to the VR environment
  }
}
