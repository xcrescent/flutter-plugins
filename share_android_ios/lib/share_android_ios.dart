
import 'share_android_ios_platform_interface.dart';

class ShareAndroidIos {
  Future<String?> getPlatformVersion() {
    return ShareAndroidIosPlatform.instance.getPlatformVersion();
  }
}
