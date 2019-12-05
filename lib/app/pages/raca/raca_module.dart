import 'package:iMyPet/app/pages/raca/raca_repository.dart';
import 'package:iMyPet/app/pages/raca/raca_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class RacaModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => RacaBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => RacaRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<RacaModule>.of();
}
