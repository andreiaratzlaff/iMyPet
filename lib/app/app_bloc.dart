import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:imypet/app/app_module.dart';
import 'package:imypet/app/pages/pet/pet_repository.dart';

class AppBloc extends BlocBase {
  //dispose will be called automatically by closing its streams

  @override
  void dispose() {
    super.dispose();
  }
}
