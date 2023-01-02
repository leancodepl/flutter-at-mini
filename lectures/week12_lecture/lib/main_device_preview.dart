import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:week12_lecture/app.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          useInheritedMediaQuery: true,
        ), // Wrap your app
      ),
    );
