import 'package:iMyPet/app/pages/hotel/hotel_repository.dart';
import 'package:iMyPet/app/pages/hotel/hotel_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class HotelModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HotelBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => HotelRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<HotelModule>.of();
}
