import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:iMyPet/models/meusdados_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../app_module.dart';
import 'meudados_repository.dart';

class MeusdadosBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<MeusdadosRepository>();
  get meusdados => _repository.meusdados;

  // MeusdadosEdit
  String _documentId;
  String _nome;
  String _cpf;
  String _email;
  String _genero;
  String _dddCelular;
  String _dddTelefone;
  String _cep;
  String _endereco;
  String _estado;

  MeusdadosBloc() {
    _nomeController.listen((value) => _nome = value);
    _nomeController.listen((value) => _cpf = value);
    _nomeController.listen((value) => _email = value);
    _nomeController.listen((value) => _genero = value);
    _nomeController.listen((value) => _dddCelular = value);
    _nomeController.listen((value) => _dddTelefone = value);
    _nomeController.listen((value) => _cep = value);
    _nomeController.listen((value) => _endereco = value);
    _nomeController.listen((value) => _estado = value);
  }

  void setMeusdados(Meusdados meusdados) {
    _documentId = meusdados.documentId();
    setNome(meusdados.nome);
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;

  void setNome(String valor) => _nomeController.sink.add(valor);

  bool insertOrUpdate() {
    var meusdados = Meusdados()..nome = _nome;
   if (_documentId?.isEmpty ?? true) {
      _repository.add(meusdados);
    } else {
      _repository.update(_documentId, meusdados);
    }

    return true;
  }

  void delete(String documentId) => _repository.delete(documentId);

  @override
  void dispose() {
    _nomeController.close();
    super.dispose();
  }
}
