import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/raca/raca_bloc.dart';
import 'package:iMyPet/app/pages/raca/raca_module.dart';

void main() {
  initModule(RacaModule());
  RacaBloc bloc;

  setUp(() {
    bloc = RacaModule.to.bloc<RacaBloc>();
  });

  group('RacaBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<RacaBloc>());
    });
  });
}
