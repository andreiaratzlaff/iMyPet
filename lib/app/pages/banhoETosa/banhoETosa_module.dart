import 'package:iMyPet/app/pages/banhoETosa/banhoETosa_repository.dart';
import 'package:iMyPet/app/pages/banhoETosa/banhoETosa_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class BanhoETosaModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => BanhoETosaBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => BanhoETosaRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<BanhoETosaModule>.of();
}
