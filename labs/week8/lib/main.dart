import 'package:flutter/material.dart';

import 'task1.dart';
import 'task2.dart';
import 'task3.dart';

void main() {
  runApp(const Week8App());
}

class Week8App extends StatelessWidget {
  const Week8App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 8 – Animations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF58A6FF),
          secondary: Color(0xFF7EE787),
          surface: Color(0xFF161B22),
          error: Color(0xFFF85149),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF161B22),
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF21262D),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFF30363D)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF238636),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Week 8 – Animations Lab')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _TaskCard(
            title: 'Task 1: Implicit Animations',
            subtitle: 'AnimatedContainer, AnimatedOpacity, AnimatedAlign',
            icon: Icons.auto_awesome,
            color: const Color(0xFF58A6FF),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => const Task1Page()),
            ),
          ),
          _TaskCard(
            title: 'Task 2: AnimationController',
            subtitle: 'Explicit animations with Tweens and Curves',
            icon: Icons.precision_manufacturing,
            color: const Color(0xFF7EE787),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => const Task2Page()),
            ),
          ),
          _TaskCard(
            title: 'Task 3: Spring Physics',
            subtitle: 'SpringSimulation and physics-based animations',
            icon: Icons.sports_tennis,
            color: const Color(0xFFA371F7),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => const Task3Page()),
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withAlpha(30),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF8B949E),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Color(0xFF8B949E)),
            ],
          ),
        ),
      ),
    );
  }
}
