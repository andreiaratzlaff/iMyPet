import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/carteiravacina/carteiravacina_page.dart';

main() {
  testWidgets('CarteiravacinaPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CarteiraVacinaPage(title: 'Carteiravacina')));
    final titleFinder = find.text('Carteiravacina');
    expect(titleFinder, findsOneWidget);
  });
}
