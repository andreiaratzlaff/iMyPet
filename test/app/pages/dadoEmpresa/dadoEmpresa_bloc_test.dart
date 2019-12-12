import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/dadoEmpresa/dadoEmpresa_bloc.dart';
import 'package:iMyPet/app/pages/dadoEmpresa/dadoEmpresa_module.dart';

void main() {
  initModule(DadoEmpresaModule());
  DadoEmpresaBloc bloc;

  setUp(() {
    bloc = DadoEmpresaModule.to.bloc<DadoEmpresaBloc>();
  });

  group('DadoEmpresaBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<DadoEmpresaBloc>());
    });
  });
}
