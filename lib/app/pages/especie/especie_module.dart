import 'package:iMyPet/app/pages/especie/especie_repository.dart';
import 'package:iMyPet/app/pages/especie/especie_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class EspecieModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) =>EspecieBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => EspecieRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<EspecieModule>.of();
}
