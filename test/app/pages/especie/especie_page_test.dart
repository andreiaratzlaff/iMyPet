import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/especie/especie_page.dart';

main() {
  testWidgets('EspeciePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(EspeciePage(title: 'Especie')));
    final titleFinder = find.text('Especie');
    expect(titleFinder, findsOneWidget);
  });
}
