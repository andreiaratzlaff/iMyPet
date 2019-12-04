import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/vacinas/vacinas_page.dart';

main() {
  testWidgets('VacinasPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(VacinasPage(title: 'Vacinas')));
    final titleFinder = find.text('Vacinas');
    expect(titleFinder, findsOneWidget);
  });
}
