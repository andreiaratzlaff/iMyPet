import 'package:iMyPet/app/pages/dogWalker/dogWalker_repository.dart';
import 'package:iMyPet/app/pages/dogWalker/dogWalker_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class DogWalkerModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => DogWalkerBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => DogWalkerRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<DogWalkerModule>.of();
}
