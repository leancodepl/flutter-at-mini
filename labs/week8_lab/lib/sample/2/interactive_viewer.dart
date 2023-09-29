import 'package:flutter/material.dart';

class InteractiveViewerExample extends StatelessWidget {
  const InteractiveViewerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          child: const SizedBox(
            width: 1200,
            height: 900,
            child: LicensePage(),
          ),
        ),
      ),
    );
  }
}
