import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_unreal_vr_plugin_platform_interface.dart';

/// An implementation of [MyUnrealVrPluginPlatform] that uses method channels.
class MethodChannelMyUnrealVrPlugin extends MyUnrealVrPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel _channel = const MethodChannel('my_unreal_vr_plugin');


  Future<void> startVR() async {
    try {
      await _channel.invokeMethod('startVR');
    } on PlatformException catch (e) {
      throw 'Error starting VR environment: ${e.message}';
    }
  }
  Future<void> stopVR() async {
    try {
      await _channel.invokeMethod('stopVR');
    } on PlatformException catch (e) {
      throw 'Error stopping VR environment: ${e.message}';
    }
  }
  Future<void> sendInput(String input) async {
    try {
      await _channel.invokeMethod('sendInput', input);
    } on PlatformException catch (e) {
      throw 'Error sending input to VR environment: ${e.message}';
    }
  }



}
