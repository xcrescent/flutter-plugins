import 'package:flutter_test/flutter_test.dart';
import 'package:my_unreal_vr_plugin/my_unreal_vr_plugin.dart';
import 'package:my_unreal_vr_plugin/my_unreal_vr_plugin_platform_interface.dart';
import 'package:my_unreal_vr_plugin/my_unreal_vr_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyUnrealVrPluginPlatform
    with MockPlatformInterfaceMixin
    implements MyUnrealVrPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MyUnrealVrPluginPlatform initialPlatform = MyUnrealVrPluginPlatform.instance;

  test('$MethodChannelMyUnrealVrPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMyUnrealVrPlugin>());
  });

  test('getPlatformVersion', () async {
    MyUnrealVrPlugin myUnrealVrPlugin = MyUnrealVrPlugin();
    MockMyUnrealVrPluginPlatform fakePlatform = MockMyUnrealVrPluginPlatform();
    MyUnrealVrPluginPlatform.instance = fakePlatform;

    expect(await myUnrealVrPlugin.getPlatformVersion(), '42');
  });
}
