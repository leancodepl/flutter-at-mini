import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  const Containers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        width: 300,
        height: 300,
        child: Center(
          child: Container(
            color: Colors.green,
            width: 200,
            height: 200,
            child: Center(
              child: Container(
                color: Colors.yellow,
                child: Text(
                  'Hello!',
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
