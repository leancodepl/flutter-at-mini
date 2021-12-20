import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week11_lecture/sample2_widget.dart';

class SampleCubitMock extends MockCubit<String?> implements SampleCubit {}

void main() {
  group("SampleWidget Golden", () {
    late SampleCubit sampleCubit;

    setUp(() {
      sampleCubit = SampleCubitMock();
    });

    testWidgets('When message is empty Should show progress indicator',
            (WidgetTester tester) async {
          //when
          await tester.pumpWidget(Sample2Widget(cubit: sampleCubit));
          //then
          expect(find.byType(Sample2Widget), matchesGoldenFile('Sample2Loading.png'));
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
          expect(find.byType(Sample2Widget), matchesGoldenFile('Sample2Message.png'));
        });
  });
}
