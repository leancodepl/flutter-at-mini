import 'package:flutter/material.dart';

import '../demos/implicit/animated_align_demo.dart';
import '../demos/implicit/animated_container_demo.dart';
import '../demos/implicit/animated_opacity_demo.dart';
import '../demos/implicit/animated_switcher_demo.dart';
import '../demos/implicit/animations_package_demo.dart';
import '../demos/implicit/hero_demo.dart';
import '../demos/implicit/tween_animation_builder_demo.dart';

class ImplicitAnimationsPage extends StatelessWidget {
  const ImplicitAnimationsPage({super.key});

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
              Text(
                'Implicit Animations',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.5,
                ),
              ),
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
