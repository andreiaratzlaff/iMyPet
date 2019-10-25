import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:imypet/app/pages/pet/pet_repository.dart';

import '../../app_module.dart';

class PetBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<PetRepository>();

  get pet => _repository.pet;

  void delete(String _documentId) => _repository.delete(_documentId);
  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}
