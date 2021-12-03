import 'package:flutter/material.dart';

class GalleryApp0 extends StatelessWidget {
  const GalleryApp0({
    Key? key,
    required this.child,
  }) : super(key: key);

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
