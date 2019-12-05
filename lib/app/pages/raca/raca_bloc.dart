import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:iMyPet/models/raca_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import 'raca_repository.dart';

class RacaBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<RacaRepository>();
  get raca => _repository.raca;

  // VacinasEdit
   String _documentId;
  String _nomeRaca;

    RacaBloc() {
    _nomeRacaController.listen((value) => _nomeRaca = value);
  }

  void setRaca(Raca raca) {
    _documentId = raca.documentId();
    setNomeRaca(raca.nomeRaca);
  }

   var _nomeRacaController = BehaviorSubject<String>();
  Stream<String> get outNomeRaca => _nomeRacaController.stream;
  void setNomeRaca(String valor) => _nomeRacaController.sink.add(valor);
 

  bool insertOrUpdate() {
    var raca = Raca()
..nomeRaca = _nomeRaca;

     

    if (_documentId?.isEmpty ?? true) {
      _repository.add(raca);
    } else {
      _repository.update(_documentId, raca);
    }

    return true;
  }

  void delete(String documentId) => _repository.delete(documentId);

  @override
  void dispose() {
    super.dispose();
  }
}
