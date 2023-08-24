import 'dart:io';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'my_unreal_vr_plugin_method_channel.dart';

abstract class MyUnrealVrPluginPlatform extends PlatformInterface {
  /// Constructs a MyUnrealVrPluginPlatform.
  MyUnrealVrPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static MyUnrealVrPluginPlatform _instance = MethodChannelMyUnrealVrPlugin();

  /// The default instance of [MyUnrealVrPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelMyUnrealVrPlugin].
  static MyUnrealVrPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MyUnrealVrPluginPlatform] when
  /// they register themselves.
  static set instance(MyUnrealVrPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
  Future<void> startVR() async {
    try {
      // if(Platform.isAndroid)
      await _instance.startVR();
    } catch (e) {
      throw UnimplementedError('platformVersion() has not been implemented.');
    }
  }

  Future<void> stopVR() async {
    try {
      // if(Platform.isAndroid)
      await _instance.stopVR();
    } catch (e) {
      throw UnimplementedError('platformVersion() has not been implemented.');
    }
  }

  Future<void> sendInput(String input) async {
   try {
      // if(Platform.isAndroid)
      await _instance.sendInput(input);
    } catch (e) {
      throw UnimplementedError('platformVersion() has not been implemented.');
    }
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
