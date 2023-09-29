import 'package:flutter/material.dart';

class GalleryApp0 extends StatelessWidget {
  const GalleryApp0({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Material(
        child: child,
      ),
    );
  }
}
