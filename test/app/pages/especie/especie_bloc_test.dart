import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/especie/especie_bloc.dart';
import 'package:iMyPet/app/pages/especie/especie_module.dart';

void main() {
  initModule(EspecieModule());
  EspecieBloc bloc;

  setUp(() {
    bloc = EspecieModule.to.bloc<EspecieBloc>();
  });

  group('EspecieBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<EspecieBloc>());
    });
  });
}
