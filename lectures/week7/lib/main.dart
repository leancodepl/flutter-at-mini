import 'package:lecture_week7/pages/explicit_animations_page.dart';
import 'package:lecture_week7/pages/implicit_animations_page.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const AnimationsShowcaseApp());
}

class const AnimationsShowcaseApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations Showcase',
      debugShowCheckedModeBanner: false,
      theme: .new(
        colorScheme: .fromSeed(
          seedColor: Colors.green,
          dynamicSchemeVariant: .vibrant,
        ),
        elevatedButtonTheme: const .new(variant: .material3Expressive),
        iconButtonTheme: const .new(variant: .material3Expressive),
      ),
      home: const HomePage(),
    );
  }
}

class const HomePage({super.key}) extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState() extends State<HomePage> {
  int _currentIndex = 0;

  final _pages = const [ImplicitAnimationsPage(), ExplicitAnimationsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.auto_awesome_outlined),
            selectedIcon: Icon(Icons.auto_awesome),
            label: 'Implicit',
          ),
          NavigationDestination(
            icon: Icon(Icons.precision_manufacturing_outlined),
            selectedIcon: Icon(Icons.precision_manufacturing),
            label: 'Explicit',
          ),
        ],
      ),
    );
  }
}
