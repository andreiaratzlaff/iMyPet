import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/pet/pet_bloc.dart';
import 'package:iMyPet/app/pages/pet/pet_module.dart';

void main() {
  initModule(PetModule());
  PetBloc bloc;

  setUp(() {
    bloc = PetModule.to.bloc<PetBloc>();
  });

  group('PetBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<PetBloc>());
    });
  });
}
