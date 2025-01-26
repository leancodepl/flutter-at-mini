import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week8/main.dart';

void main() {
  testWidgets('HomePage displays four cards', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    expect(find.widgetWithText(Card, 'In-memory'), findsOneWidget);
    expect(find.widgetWithText(Card, 'Drift'), findsOneWidget);
    expect(find.widgetWithText(Card, 'Hive'), findsOneWidget);
    expect(find.widgetWithText(Card, 'Localstore'), findsOneWidget);
  });
}
