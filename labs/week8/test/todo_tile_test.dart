import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week8/todo.dart';
import 'package:week8/todo_page.dart';

void main() {
  group('Todo tile', () {
    testWidgets('Done Todo tile', (tester) async {
      const todo = Todo(id: '123', title: 'Hello, world!', done: true);

      await tester.pumpWidget(const MaterialApp(home: TodoTile(todo: todo)));

      expect(find.text('Hello, world!'), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Checkbox && widget.value != null && widget.value!,
        ),
        findsOneWidget,
      );
    });

    testWidgets('Undone Todo tile', (tester) async {
      const todo = Todo(id: '123', title: 'Hello, world!', done: false);

      await tester.pumpWidget(const MaterialApp(home: TodoTile(todo: todo)));

      expect(find.text('Hello, world!'), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Checkbox && widget.value != null && !widget.value!,
        ),
        findsOneWidget,
      );
    });
  });
}
