import 'package:flutter/material.dart';
import 'package:week12_lecture/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    this.useInheritedMediaQuery = false,
    this.locale,
    this.builder,
  });

  final bool useInheritedMediaQuery;
  final Locale? locale;
  final Widget Function(BuildContext, Widget?)? builder;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: useInheritedMediaQuery,
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
