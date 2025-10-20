import 'package:flutter/material.dart';

class BuildAwareWidget extends StatefulWidget {
  const BuildAwareWidget({
    required this.index,
    required this.parent,
    required this.child,
    super.key,
  });

  final int index;
  final String parent;
  final Widget child;

  @override
  State<BuildAwareWidget> createState() => _BuildAwareWidgetState();
}

class _BuildAwareWidgetState extends State<BuildAwareWidget> {
  @override
  void initState() {
    super.initState();
    debugPrint(
      'I - ${widget.index} - was just build | parent: ${widget.parent}',
    );
  }

  @override
  void dispose() {
    debugPrint(
      'Seems that I - ${widget.index} - am no longer needed :( parent:${widget.parent}',
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
