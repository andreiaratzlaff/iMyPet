import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:iMyPet/models/especie_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../app_module.dart';
import 'especie_repository.dart';

class EspecieBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<EspecieRepository>();
  Observable<List<Especie>> get especie => _repository.especie;

  // VacinasEdit
  String _documentId;
  String _nome;

  EspecieBloc() {
    _nomeController.listen((value) => _nome = value);
  }

  void setEspecie(Especie especie) {
    _documentId = especie.documentId();
    setNome(especie.nome);
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;

  void setNome(String valor) => _nomeController.sink.add(valor);

  bool insertOrUpdate() {
    var especie = Especie()
      ..nome = _nome;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(especie);
    } else {
      _repository.update(_documentId, especie);
    }

    return true;
  }

  void delete(String documentId) => _repository.delete(documentId);

  getEspecie(String especieId) {
    return _repository.especieId(especieId);
  }

  @override
  void dispose() {
    _nomeController.close();
    super.dispose();
  }
}
