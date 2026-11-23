import 'package:labs_week8/task1.dart';
import 'package:labs_week8/task2.dart';
import 'package:labs_week8/task3.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const Week8App());
}

class const Week8App({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 8 – Animations',
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

  static const _tasks = [
    (title: 'Task 1: Profile Card', page: Task1Page()),
    (title: 'Task 2: Pulsing Indicator', page: Task2Page()),
    (title: 'Task 3: Spring Physics', page: Task3Page()),
  ];

  @override
  Widget build(BuildContext context) {
    final task = _tasks[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: task.page,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.badge_outlined),
            selectedIcon: Icon(Icons.badge),
            label: 'Implicit',
          ),
          NavigationDestination(
            icon: Icon(Icons.precision_manufacturing_outlined),
            selectedIcon: Icon(Icons.precision_manufacturing),
            label: 'Controller',
          ),
          NavigationDestination(
            icon: Icon(Icons.sports_tennis_outlined),
            selectedIcon: Icon(Icons.sports_tennis),
            label: 'Physics',
          ),
        ],
      ),
    );
  }
}
