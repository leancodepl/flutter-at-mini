import 'package:flutter/material.dart';

class RichTextExample extends StatelessWidget {
  const RichTextExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: const TextSpan(
            text: 'This text is normal ',
            style: TextStyle(
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'but this is underlined ',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
                children: [
                  TextSpan(
                    text: 'and this one is bold.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
