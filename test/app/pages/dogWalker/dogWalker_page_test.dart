import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/dogWalker/dogWalker_page.dart';

main() {
  testWidgets('DogWalkerPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(DogWalkerPage(title: 'DogWalker')));
    final titleFinder = find.text('DogWalker');
    expect(titleFinder, findsOneWidget);
  });
}
