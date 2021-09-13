import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_root_detection/flutter_root_detection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _jailbroken;
  bool? _developerMode;

  @override
  void initState() {
    super.initState();
    checkDetection();
  }
/// [checkDetection] Checks for Root Detection
  Future<void> checkDetection() async {
    try {
      _jailbroken = await FlutterRootDetection.jailbroken;
      _developerMode = await FlutterRootDetection.developerMode;
      setState(() {});
    } on PlatformException {
      _jailbroken = true;
      _developerMode = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Running JailBreak: $_jailbroken'),
            Text('Running DeveloperMode: $_developerMode'),
          ],
        ),
      ),
    );
  }
}
