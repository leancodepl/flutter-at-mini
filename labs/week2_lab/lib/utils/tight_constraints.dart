import 'package:flutter/material.dart';

class TightConstraints extends StatelessWidget {
  const TightConstraints({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints.tight(constraints.biggest),
        child: child,
      ),
    );
  }
}
