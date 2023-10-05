import 'package:flutter/material.dart';

class RichTextExample extends StatelessWidget {
  const RichTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 50,
          ),
          child: RichText(
            text: const TextSpan(
              text: 'This text is normal ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
              ),
              children: [
                TextSpan(
                  text: 'but this is underlined ',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    backgroundColor: Colors.green,
                  ),
                  children: [
                    TextSpan(
                      text: 'and this one is bold.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    WidgetSpan(
                      child: SizedBox(height: 100, child: FlutterLogo()),
                    ),
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
      ),
    );
  }
}
