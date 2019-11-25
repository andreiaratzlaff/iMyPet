import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/banhoETosa/banhoETosa_page.dart';

main() {
  testWidgets('BanhoETosaPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(BanhoETosaPage(title: 'BanhoETosa')));
    final titleFinder = find.text('BanhoETosa');
    expect(titleFinder, findsOneWidget);
  });
}
