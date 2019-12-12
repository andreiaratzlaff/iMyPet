import 'package:iMyPet/app/pages/dadoEmpresa/dadoEmpresa_repository.dart';
import 'package:iMyPet/app/pages/dadoEmpresa/dadoEmpresa_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class DadoEmpresaModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => DadoEmpresaBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => DadoEmpresaRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<DadoEmpresaModule>.of();
}
