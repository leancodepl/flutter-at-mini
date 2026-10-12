import 'package:flutter/material.dart';

class const TightConstraints({super.key, required final Widget child})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints.tight(constraints.biggest),
          child: child,
        );
      },
    );
  }
}
