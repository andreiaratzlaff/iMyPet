import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/dogWalker/dogWalker_bloc.dart';
import 'package:iMyPet/app/pages/dogWalker/dogWalker_module.dart';

void main() {
  initModule(DogWalkerModule());
  DogWalkerBloc bloc;

  setUp(() {
    bloc = DogWalkerModule.to.bloc<DogWalkerBloc>();
  });

  group('DogWalkerBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<DogWalkerBloc>());
    });
  });
}
