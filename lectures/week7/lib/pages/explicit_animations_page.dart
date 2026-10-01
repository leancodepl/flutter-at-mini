import 'package:flutter/material.dart';

import 'package:lecture_week7/demos/explicit/animated_widgets_demo.dart';
import 'package:lecture_week7/demos/explicit/animation_controller_demo.dart';
import 'package:lecture_week7/demos/explicit/curves_and_tweens_demo.dart';
import 'package:lecture_week7/demos/explicit/spring_demo.dart';
import 'package:lecture_week7/demos/explicit/staggered_animation_demo.dart';

class const ExplicitAnimationsPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Icon(Icons.precision_manufacturing, color: Color(0xFF58A6FF)),
              SizedBox(width: 12),
              Text('Explicit Animations'),
            ],
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: 'AnimationController'),
              Tab(text: 'Curves & Tweens'),
              Tab(text: 'Springs'),
              Tab(text: 'Staggered'),
              Tab(text: 'Animated Widgets'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AnimationControllerDemo(),
            CurvesAndTweensDemo(),
            SpringDemo(),
            StaggeredAnimationDemo(),
            AnimatedWidgetsDemo(),
          ],
        ),
      ),
    );
  }
}
