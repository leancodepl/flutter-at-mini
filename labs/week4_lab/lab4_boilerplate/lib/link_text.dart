import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  const LinkText({
    super.key,
    required this.text,
    required this.onTap,
  });

  final Widget text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: DefaultTextStyle(
          style: const TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.cyan,
          ),
          child: text,
        ),
      ),
    );
  }
}
