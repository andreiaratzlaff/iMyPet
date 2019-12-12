import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/dadoEmpresa/dadoEmpresa_page.dart';

main() {
  testWidgets('DadoEmpresaPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(DadoEmpresaPage(title: 'DadoEmpresa')));
    final titleFinder = find.text('DadoEmpresa');
    expect(titleFinder, findsOneWidget);
  });
}
