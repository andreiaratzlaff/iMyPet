import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/meusdados/meusdados_bloc.dart';
import 'package:iMyPet/app/pages/meusdados/meusdados_module.dart';

void main() {
  initModule(MeusdadosModule());
  MeusdadosBloc bloc;

  setUp(() {
    bloc = MeusdadosModule.to.bloc<MeusdadosBloc>();
  });

  group('MeusdadosBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<MeusdadosBloc>());
    });
  });
}
