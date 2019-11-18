//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/meusdados/meusdados_page.dart';

main() {
  testWidgets('MeusdadosPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(MeusdadosPage(title: 'Meusdados')));
    final titleFinder = find.text('Meusdados');
    expect(titleFinder, findsOneWidget);
  });
}
