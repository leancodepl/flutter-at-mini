import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week11_lecture/sample2_widget.dart';

class SampleCubitMock extends MockCubit<String?> implements SampleCubit {}

void main() {
  group("Sample2WidgetTest", () {
    late SampleCubit sampleCubit;

    setUp(() {
      sampleCubit = SampleCubitMock();
    });

    testWidgets('When message is empty Should show progress indicator',
        (WidgetTester tester) async {
      //when
      await tester.pumpWidget(Sample2Widget(cubit: sampleCubit));
      //then
      final progressBarFinder = find.byType(CircularProgressIndicator);
      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('When message is not empty Should show message',
        (WidgetTester tester) async {
      //given
      const message = "sampleMessage";
      whenListen(sampleCubit, Stream.value(message));
      //when
      await tester.pumpWidget(Sample2Widget(cubit: sampleCubit));
      await tester.pump();
      //then
      final progressBarFinder = find.byType(CircularProgressIndicator);
      final messageFinder = find.text(message);
      expect(progressBarFinder, findsNothing);
      expect(messageFinder, findsOneWidget);
    });
  });
}
