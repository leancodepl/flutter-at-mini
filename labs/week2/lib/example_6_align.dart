import 'package:flutter/material.dart';

class Example6 extends StatefulWidget {
  const Example6({super.key});

  @override
  State<Example6> createState() => _Example6State();
}

class _Example6State extends State<Example6> {
  var _xAlignment = 0.0;
  var _yAlignment = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 32,
          right: 32,
          top: 0,
          child: Column(
            children: [
              Slider(
                value: _xAlignment,
                min: -3,
                max: 3,
                onChanged: (value) => setState(() => _xAlignment = value),
              ),
              Text(
                'X = ${_xAlignment.toStringAsFixed(3)}',
                style: const TextStyle(fontSize: 48),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 32,
          bottom: 32,
          child: Row(
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: Slider(
                  value: _yAlignment,
                  min: -3,
                  max: 3,
                  onChanged: (value) => setState(() => _yAlignment = value),
                ),
              ),
              Text(
                'Y = ${_yAlignment.toStringAsFixed(3)}',
                style: const TextStyle(fontSize: 48),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            width: 600,
            height: 400,
            color: Colors.blue,
            child: Align(
              alignment: Alignment(_xAlignment, _yAlignment),
              child: Container(
                width: 200,
                height: 100,
                color: Colors.amber,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
