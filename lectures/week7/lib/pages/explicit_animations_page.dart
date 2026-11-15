import 'package:lecture_week7/demos/explicit/animated_widgets_demo.dart';
import 'package:lecture_week7/demos/explicit/animation_controller_demo.dart';
import 'package:lecture_week7/demos/explicit/curves_and_tweens_demo.dart';
import 'package:lecture_week7/demos/explicit/material_springs_demo.dart';
import 'package:lecture_week7/demos/explicit/spring_demo.dart';
import 'package:lecture_week7/demos/explicit/staggered_animation_demo.dart';
import 'package:material_ui/material_ui.dart';

class const ExplicitAnimationsPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Explicit Animations'),
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: 'AnimationController'),
              Tab(text: 'Curves & Tweens'),
              Tab(text: 'Springs'),
              Tab(text: 'Material Springs'),
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
            MaterialSpringsDemo(),
            StaggeredAnimationDemo(),
            AnimatedWidgetsDemo(),
          ],
        ),
      ),
    );
  }
}
