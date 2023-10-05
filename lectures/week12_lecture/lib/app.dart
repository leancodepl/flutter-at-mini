import 'package:flutter/material.dart';
import 'package:week12_lecture/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    this.locale,
    this.builder,
  });

  final Locale? locale;
  final Widget Function(BuildContext, Widget?)? builder;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: locale,
      builder: builder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
