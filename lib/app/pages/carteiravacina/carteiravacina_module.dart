import 'package:iMyPet/app/pages/carteiravacina/carteiravacina_repository.dart';
import 'package:iMyPet/app/pages/carteiravacina/carteiravacina_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class CarteiravacinaModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CarteiraVacinaBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => CarteiraVacinaRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<CarteiravacinaModule>.of();
}
