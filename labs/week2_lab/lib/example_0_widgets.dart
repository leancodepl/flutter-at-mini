// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class SuperComplexLayout extends StatelessWidget {
  const SuperComplexLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 400,
          child: Image.asset('images/gmach.jpg'),
        ),
        const TopRight(
          child: SizedBox(
            width: 200,
            child: ListOfWidgets(),
          ),
        ),
      ],
    );
  }
}

class PurpleBox extends StatelessWidget {
  const PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.purple,
        width: 200,
        height: 100,
      ),
    );
  }
}

class ListOfWidgets extends StatelessWidget {
  const ListOfWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          width: 200,
          height: 100,
        ),
        Container(
          color: Colors.green,
          width: 200,
          height: 100,
        ),
        Container(
          color: Colors.blue,
          width: 200,
          height: 100,
        ),
        Container(
          color: Colors.purple,
          width: 200,
          height: 100,
          child: const Text('Hello!'),
        ),
      ],
    );
  }
}

class TopRight extends StatelessWidget {
  const TopRight({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: child,
    );
  }
}

class MyStack extends StatelessWidget {
  const MyStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned(
          right: 0,
          bottom: 0,
          child: SuperComplexLayout(),
        ),
        Center(
          child: PurpleBox(),
        ),
      ],
    );
  }
}
