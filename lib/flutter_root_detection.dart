import 'dart:async';

import 'package:flutter/services.dart';

class FlutterRootDetection {
///[_channel] channel to communicate with the native Operating System
  static const MethodChannel _channel = MethodChannel('flutter_root_detection');
/// [platformVersion] platformversion
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
///[jailbroken] check for root
  static Future<bool> get jailbroken async {
    bool? jailbroken = await _channel.invokeMethod<bool>('jailbroken');
    return jailbroken ?? true;
  }
///[developerMode] check for Developer mode turn on
  static Future<bool> get developerMode async {
    bool? developerMode = await _channel.invokeMethod<bool>('developerMode');
    return developerMode ?? true;
  }
}
