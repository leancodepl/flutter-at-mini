import 'package:flutter/material.dart';

import 'package:lecture_week7/demos/implicit/animated_align_demo.dart';
import 'package:lecture_week7/demos/implicit/animated_container_demo.dart';
import 'package:lecture_week7/demos/implicit/animated_opacity_demo.dart';
import 'package:lecture_week7/demos/implicit/animated_switcher_demo.dart';
import 'package:lecture_week7/demos/implicit/animations_package_demo.dart';
import 'package:lecture_week7/demos/implicit/hero_demo.dart';
import 'package:lecture_week7/demos/implicit/tween_animation_builder_demo.dart';

class const ImplicitAnimationsPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Icon(Icons.auto_awesome, color: Color(0xFF7EE787)),
              SizedBox(width: 12),
              Text('Implicit Animations'),
            ],
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: 'AnimatedContainer'),
              Tab(text: 'AnimatedOpacity'),
              Tab(text: 'AnimatedSwitcher'),
              Tab(text: 'AnimatedAlign'),
              Tab(text: 'TweenAnimationBuilder'),
              Tab(text: 'Hero'),
              Tab(text: 'Animations Package'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AnimatedContainerDemo(),
            AnimatedOpacityDemo(),
            AnimatedSwitcherDemo(),
            AnimatedAlignDemo(),
            TweenAnimationBuilderDemo(),
            HeroDemo(),
            AnimationsPackageDemo(),
          ],
        ),
      ),
    );
  }
}
