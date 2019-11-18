import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/carteiravacina/carteiravacina_bloc.dart';
import 'package:iMyPet/app/pages/carteiravacina/carteiravacina_module.dart';

void main() {
  initModule(CarteiravacinaModule());
  CarteiraVacinaBloc bloc;

  setUp(() {
    bloc = CarteiravacinaModule.to.bloc<CarteiraVacinaBloc>();
  });

  group('CarteiravacinaBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<CarteiraVacinaBloc>());
    });
  });
}
