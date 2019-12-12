import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/hotel/hotel_page.dart';

main() {
  testWidgets('HotelPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HotelPage(title: 'Hotel')));
    final titleFinder = find.text('Hotel');
    expect(titleFinder, findsOneWidget);
  });
}
