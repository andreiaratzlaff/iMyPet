import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:imypet/app/app_module.dart';
import 'package:imypet/app/pages/pet/pet_repository.dart';

class AppBloc extends BlocBase {
  //dispose will be called automatically by closing its streams
var _repository = AppModule.to.getDependency<PetRepository>();


get pet => _repository.pet;


void delete(String _documentId) => _repository.delete(_documentId);



  @override
  void dispose() {
    super.dispose();
  }
}
