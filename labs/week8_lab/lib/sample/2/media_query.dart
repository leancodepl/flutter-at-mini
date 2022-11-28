import 'package:flutter/material.dart';

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.indigo,
          width: width * 0.5,
          height: width,
        ),
      ),
    );
  }
}
