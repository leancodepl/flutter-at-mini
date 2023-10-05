import 'package:flutter/material.dart';

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Row(
          children: <Widget>[
            Flexible(
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(color: Colors.deepOrange),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(color: Colors.lightBlue),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Container(color: Colors.orange),
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(color: Colors.blue),
                        ),
                        Flexible(child: Container(color: Colors.green)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
