import 'package:flutter/material.dart';
import 'package:lecture_week3/demo_01_element_tree.dart' show ElementTreeDemo;
import 'package:lecture_week3/demo_02_identity.dart' show IdentityDemo;
import 'package:lecture_week3/demo_03_lifecycle.dart' show LifecycleDemo;
import 'package:lecture_week3/demo_04_gestures.dart' show GesturesDemo;
import 'package:lecture_week3/demo_05_rebuilds.dart' show CounterPage;
import 'package:lecture_week3/demo_06_global_key.dart' show GlobalKeyExample;
import 'package:lecture_week3/demo_07_keys.dart' show FormExample;
import 'package:lecture_week3/demo_08_inherited.dart' show InheritedDemo;
import 'package:lecture_week3/demo_09_provider.dart' show ProviderExample;
import 'package:lecture_week3/demo_10_context_pitfalls.dart' show PitfallsMenu;
import 'package:lecture_week3/demo_11_listenables.dart' show ListenablesMenu;
import 'package:lecture_week3/demo_12_good_practices.dart'
    show GoodPracticesDemo;

/// All live demos in one app – pick one from the list, go back, pick another.
///
/// Run: `fvm flutter run -d macos -t lib/demo_00_all.dart`
///
/// Every demo can still be started on its own (see DEMOS.md); step-by-step
/// instructions are in the doc comment at the top of each file.
void main() {
  runApp(const MaterialApp(title: 'Week 3 demos', home: DemoBrowser()));
}

class Demo({
  required final String slides,
  required final String title,
  required final String file,
  required final WidgetBuilder builder,
});

final demos = [
  Demo(
    slides: '4–13',
    title: 'Widget tree vs element tree, Container internals',
    file: 'demo_01_element_tree.dart',
    builder: (context) => const ElementTreeDemo(),
  ),
  Demo(
    slides: '14–17, 23–25',
    title: 'Creating vs building, widget vs element identity',
    file: 'demo_02_identity.dart',
    builder: (context) => const IdentityDemo(),
  ),
  Demo(
    slides: '33, 52–55',
    title: 'State lifecycle',
    file: 'demo_03_lifecycle.dart',
    builder: (context) => const LifecycleDemo(),
  ),
  Demo(
    slides: '40–41',
    title: 'Hit testing & gesture arena',
    file: 'demo_04_gestures.dart',
    builder: (context) => const GesturesDemo(),
  ),
  Demo(
    slides: '50, 89',
    title: 'What setState rebuilds',
    file: 'demo_05_rebuilds.dart',
    builder: (context) => const CounterPage(),
  ),
  Demo(
    slides: '54',
    title: 'GlobalKey: moving a widget',
    file: 'demo_06_global_key.dart',
    builder: (context) => const GlobalKeyExample(),
  ),
  Demo(
    slides: '56, 60',
    title: 'Keys: hiding a form field',
    file: 'demo_07_keys.dart',
    builder: (context) => const FormExample(),
  ),
  Demo(
    slides: '68–69, 75',
    title: 'InheritedWidget',
    file: 'demo_08_inherited.dart',
    builder: (context) => const InheritedDemo(),
  ),
  Demo(
    slides: '70–72, 86',
    title: 'ChangeNotifier + Provider',
    file: 'demo_09_provider.dart',
    builder: (context) => const ProviderExample(),
  ),
  Demo(
    slides: '76–77',
    title: 'BuildContext pitfalls',
    file: 'demo_10_context_pitfalls.dart',
    builder: (context) => const PitfallsMenu(),
  ),
  Demo(
    slides: '79–86',
    title: 'Listenables',
    file: 'demo_11_listenables.dart',
    builder: (context) => const ListenablesMenu(),
  ),
  Demo(
    slides: '90–93',
    title: 'Good practices',
    file: 'demo_12_good_practices.dart',
    builder: (context) => const GoodPracticesDemo(),
  ),
];

class const DemoBrowser({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kontekst dla BuildContext – demos')),
      body: ListView.separated(
        itemCount: demos.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final demo = demos[index];
          return ListTile(
            leading: SizedBox(
              width: 96,
              child: Text(
                demo.slides,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            title: Text(demo.title),
            subtitle: Text('lib/${demo.file}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () =>
                Navigator.of(context)
                    .push(MaterialPageRoute<void>(builder: demo.builder)),
          );
        },
      ),
    );
  }
}
