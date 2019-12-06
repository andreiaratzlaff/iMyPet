import 'package:iMyPet/app/pages/pet/pet_repository.dart';
import 'package:iMyPet/app/pages/pet/pet_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class PetModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) =>PetBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => PetRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<PetModule>.of();
}