import 'package:flutter/material.dart';

class TightConstraints extends StatelessWidget {
  const TightConstraints({
    Key? key,
    required this.child,
  }) : super(key: key);

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
