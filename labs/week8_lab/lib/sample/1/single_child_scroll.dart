import 'package:flutter/material.dart';

class SingleChildScrollExample extends StatelessWidget {
  const SingleChildScrollExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        children: [
          Container(
            color: Colors.green,
            height: 200,
          ),
          Container(
            color: Colors.blue,
            height: 200,
          ),
          Container(
            color: Colors.yellow,
            height: 200,
          ),
          Container(
            color: Colors.red,
            height: 200,
          ),
          Container(
            color: Colors.indigo,
            height: 200,
          ),
        ],
      ),
    );
  }
}
