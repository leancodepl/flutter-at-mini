# Live demos – week 3 (Kontekst dla BuildContext)

All demos in one app (example browser): `fvm flutter run -d macos -t lib/demo_00_all.dart` – or just `fvm flutter run -d macos` (lib/main.dart opens the same browser).
Each demo is also a separate entrypoint: `fvm flutter run -d macos -t lib/<file>.dart`.
In VS Code: pick a "Week 3 lecture: …" configuration in Run and Debug (F5).
Slide numbers refer to the current deck.

| Slides | Demo | File |
|---|---|---|
| 4–13, 18–22, 26–31 | Widget tree vs element tree in DevTools, Container internals | `lib/demo_01_element_tree.dart` |
| 14–17, 23–25 | Creating vs building a widget; widget vs element identity | `lib/demo_02_identity.dart` |
| 33, 52–55 | State lifecycle: every lifecycle method logged | `lib/demo_03_lifecycle.dart` |
| 40–41 | Hit testing (HitTestBehavior) & gesture arena | `lib/demo_04_gestures.dart` |
| 50, 89 | What setState rebuilds (watch the console) | `lib/demo_05_rebuilds.dart` |
| 54 | GlobalKey: moving a TextField between parents (toggle "use GlobalKey") | `lib/demo_06_global_key.dart` |
| 56, 60 | Keys: hide a form field with/without keys | `lib/demo_07_keys.dart` (uncomment the keys) |
| 68–69, 75 | InheritedWidget: dependents rebuild, const subtree doesn't, get… doesn't subscribe | `lib/demo_08_inherited.dart` |
| 70–72, 86 | ChangeNotifier + Provider: watch in build, read in callbacks | `lib/demo_09_provider.dart` |
| 76–77 | BuildContext pitfalls: context above Provider, context after await | `lib/demo_10_context_pitfalls.dart` |
| 79–86 | Listenables: ValueNotifier, ChangeNotifier (Cart), ScrollController, AnimationController | `lib/demo_11_listenables.dart` |
| 90–93 | Good practices: method vs widget, FutureBuilder, controller in State | `lib/demo_12_good_practices.dart` |

Step-by-step instructions: tap the ⓘ button in the demo's app bar (also in the doc comment at the top of each file).
