import 'package:flutter/material.dart';

import 'pages/explicit_animations_page.dart';
import 'pages/implicit_animations_page.dart';

void main() {
  runApp(const AnimationsShowcaseApp());
}

class AnimationsShowcaseApp extends StatelessWidget {
  const AnimationsShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations Showcase',
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
        tabBarTheme: const TabBarThemeData(
          labelColor: Color(0xFF58A6FF),
          unselectedLabelColor: Color(0xFF8B949E),
          indicatorColor: Color(0xFF58A6FF),
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
        fontFamily: 'SF Pro Display',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final _pages = const [ImplicitAnimationsPage(), ExplicitAnimationsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF30363D))),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: const Color(0xFF161B22),
          selectedItemColor: const Color(0xFF58A6FF),
          unselectedItemColor: const Color(0xFF8B949E),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome),
              label: 'Implicit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.precision_manufacturing),
              label: 'Explicit',
            ),
          ],
        ),
      ),
    );
  }
}
