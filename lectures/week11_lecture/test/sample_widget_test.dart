import 'package:flutter_test/flutter_test.dart';
import 'package:week11_lecture/sample_widget.dart';

void main() {

  testWidgets('SampleWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(const SampleWidget(title: 'T', message: 'M'));

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
