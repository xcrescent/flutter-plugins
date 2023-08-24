// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'my_unreal_vr_plugin_platform_interface.dart';

class MyUnrealVrPlugin {
  Future<void> startVR() async {
    await MyUnrealVrPluginPlatform.instance.startVR();
  }
  Future<void> stopVR() async {
    await MyUnrealVrPluginPlatform.instance.stopVR();
  }
  Future<void> sendInput(String input) async {
    await MyUnrealVrPluginPlatform.instance.sendInput(input);
  }
}
