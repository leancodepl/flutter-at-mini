import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Source: https://docs.flutter.dev/development/platform-integration/platform-channels?tab=type-mappings-kotlin-tab
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  static const eventChannel =
      EventChannel("sample.flutter/randomValueEventChannel");

  String _batteryLevel = 'Unknown battery level.';
  int _randomValue = 41;

  @override
  void initState() {
    eventChannel.receiveBroadcastStream().distinct().listen((event) {
      setState(() {
        _randomValue = event;
      });
    });
    super.initState();
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod(
        'getBatteryLevel',
        {
          "currentBatteryLevel": _batteryLevel,
        },
      );
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
            const SizedBox(height: 64),
            Text(_randomValue.toString()),
            const SizedBox(height: 64),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300, maxHeight: 200),
              child: const AndroidView(
                viewType: "androidNativeViewType",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
