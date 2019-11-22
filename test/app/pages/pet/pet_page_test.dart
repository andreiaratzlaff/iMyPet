import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/pet/pet_page.dart';

main() {
  testWidgets('PetPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(PetPage(title: 'Pet')));
    final titleFinder = find.text('Pet');
    expect(titleFinder, findsOneWidget);
  });
}
