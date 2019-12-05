import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/raca/raca_page.dart';

main() {
  testWidgets('RacaPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(RacaPage(title: 'Raca')));
    final titleFinder = find.text('Raca');
    expect(titleFinder, findsOneWidget);
  });
}
