import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'share_android_ios_platform_interface.dart';

/// An implementation of [ShareAndroidIosPlatform] that uses method channels.
class MethodChannelShareAndroidIos extends ShareAndroidIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('share_android_ios');

  Future<void> share(String message) async {
    await methodChannel.invokeMethod<void>('share', {"message":message});
    // return version;
  }
}
