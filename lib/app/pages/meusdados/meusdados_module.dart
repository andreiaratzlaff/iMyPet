
import 'package:iMyPet/app/pages/meusdados/meusdados_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:iMyPet/app/pages/meusdados/meudados_repository.dart';
class MeusdadosModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => MeusdadosBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => MeusdadosRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<MeusdadosModule>.of();
}
