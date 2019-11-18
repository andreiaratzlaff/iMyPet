import 'package:iMyPet/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:iMyPet/app/app_widget.dart';
import 'package:iMyPet/app/pages/carteiravacina/carteiravacina_repository.dart';
import 'package:iMyPet/app/pages/meusdados/meudados_repository.dart';
import 'package:iMyPet/app/pages/vacinas/vacinas_repository.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => VacinasRepository()),
        Dependency((i) => MeusdadosRepository()),
        Dependency((i) => CarteiraVacinaRepository()),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
