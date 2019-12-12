import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/hotel/hotel_bloc.dart';
import 'package:iMyPet/app/pages/hotel/hotel_module.dart';

void main() {
  initModule(HotelModule());
  HotelBloc bloc;

  setUp(() {
    bloc = HotelModule.to.bloc<HotelBloc>();
  });

  group('HotelBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<HotelBloc>());
    });
  });
}
