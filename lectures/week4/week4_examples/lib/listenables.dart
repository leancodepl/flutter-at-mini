import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const ScrollExample());
}

class AnimationExample extends StatefulWidget {
  const AnimationExample({super.key});

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample>
    with TickerProviderStateMixin {
  late final animationController = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );

  late final rotation = Tween<double>(
    begin: 0,
    end: 2 * math.pi,
  ).animate(animationController);

  @override
  void initState() {
    super.initState();

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedBuilder(
            animation: rotation,
            builder: (context, child) =>
                Transform.rotate(angle: rotation.value, child: child),
            child: Text('Hello, world!'),
          ),
        ),
      ),
    );
  }
}

class ScrollExample extends StatefulWidget {
  const ScrollExample({super.key});

  @override
  State<ScrollExample> createState() => _ScrollExampleState();
}

class _ScrollExampleState extends State<ScrollExample> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_printScrollPosition);
  }

  void _printScrollPosition() {
    print('Scroll position: ${scrollController.position.pixels}');
  }

  @override
  void dispose() {
    scrollController.removeListener(_printScrollPosition);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          controller: scrollController,
          itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
          itemCount: 100,
        ),
      ),
    );
  }
}
