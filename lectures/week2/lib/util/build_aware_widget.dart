import 'package:flutter/material.dart';

@immutable
final class const Counts(
  final int constructed,
  final int mounted,
  final int disposed,
) {
  static const zero = Counts(0, 0, 0);
}

class BuildAwareWidget({
  required final int index,
  required final String parent,
  required final Widget child,
  super.key,
}) extends StatefulWidget {
  this {
    _constructed++;
    _scheduleFlush();
    debugPrint('CONSTRUCTED -> $parent #$index');
  }

  static final counts = ValueNotifier<Counts>(Counts.zero);

  static int _constructed = 0, _mounted = 0, _disposed = 0;
  static bool _flushScheduled = false;

  static void _scheduleFlush() {
    if (_flushScheduled) {
      return;
    }
    _flushScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      counts.value = Counts(_constructed, _mounted, _disposed);
      _flushScheduled = false;
    });
  }

  static void resetCounters({String? label}) {
    _constructed = 0;
    _mounted = 0;
    _disposed = 0;
    counts.value = Counts.zero;
  }

  @override
  State<BuildAwareWidget> createState() => _BuildAwareWidgetState();
}

class _BuildAwareWidgetState() extends State<BuildAwareWidget> {
  @override
  void initState() {
    super.initState();
    BuildAwareWidget._mounted++;
    BuildAwareWidget._scheduleFlush();
    debugPrint(
      'I - ${widget.index} - was just build | parent: ${widget.parent}',
    );
  }

  @override
  void dispose() {
    BuildAwareWidget._disposed++;
    BuildAwareWidget._scheduleFlush();
    debugPrint(
      'Seems that I - ${widget.index} - am no longer needed :( parent:${widget.parent}',
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
