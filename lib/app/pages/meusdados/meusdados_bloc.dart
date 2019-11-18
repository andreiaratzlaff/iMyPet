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
  String _cidade;
  String _userId;

  MeusdadosBloc() {
    _nomeController.listen((value) => _nome = value);
    _cpfController.listen((value) => _cpf = value);
    _emailController.listen((value) => _email = value);
    _generoController.listen((value) => _genero = value);
    _dddCelularController.listen((value) => _dddCelular = value);
    _dddTelefoneController.listen((value) => _dddTelefone = value);
    _cepController.listen((value) => _cep = value);
    _enderecoController.listen((value) => _endereco = value);
    _estadoController.listen((value) => _estado = value);
    _cidadeController.listen((value) => _cidade = value);
    _userIdController.listen((value) => _userId = value);
  }

  void setMeusdados(Meusdados meusdados) {
    _documentId = meusdados.documentId();
    setNome(meusdados.nome);
    setCpf(meusdados.cpf);
    setEmail(meusdados.email);
    setGenero(meusdados.genero);
    setDDDTelefone(meusdados.dddTelefone);
    setDDDCelular(meusdados.dddCelular);
    setCep(meusdados.cep);
    setEndereco(meusdados.endereco);
    setEstado(meusdados.estado);
    setCidade(meusdados.cidade);
    setUserId(meusdados.userId);
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;
  void setNome(String valor) => _nomeController.sink.add(valor);

  var _cpfController = BehaviorSubject<String>();
  Stream<String> get outCpf => _cpfController.stream;
  void setCpf(String valor) => _cpfController.sink.add(valor);

  var _emailController = BehaviorSubject<String>();
  Stream<String> get outEmail => _emailController.stream;
  void setEmail(String valor) => _emailController.sink.add(valor);

  var _generoController = BehaviorSubject<String>();
  Stream<String> get outgenero => _generoController.stream;
  void setGenero(String valor) => _generoController.sink.add(valor);

  var _dddCelularController = BehaviorSubject<String>();
  Stream<String> get outdddCelular => _dddCelularController.stream;
  void setDDDCelular(String valor) => _dddCelularController.sink.add(valor);

  var _dddTelefoneController = BehaviorSubject<String>();
  Stream<String> get outdddTelefone => _dddTelefoneController.stream;
  void setDDDTelefone(String valor) => _dddTelefoneController.sink.add(valor);

  var _cepController = BehaviorSubject<String>();
  Stream<String> get outcep => _cepController.stream;
  void setCep(String valor) => _cepController.sink.add(valor);

  var _enderecoController = BehaviorSubject<String>();
  Stream<String> get outendereco => _enderecoController.stream;
  void setEndereco(String valor) => _enderecoController.sink.add(valor);

  var _estadoController = BehaviorSubject<String>();
  Stream<String> get outestado => _estadoController.stream;
  void setEstado(String valor) => _estadoController.sink.add(valor);

  var _cidadeController = BehaviorSubject<String>();
  Stream<String> get outcidade => _cidadeController.stream;
  void setCidade(String valor) => _cidadeController.sink.add(valor);

  var _userIdController = BehaviorSubject<String>();
  Stream<String> get outuserId => _userIdController.stream;
  void setUserId(String valor) => _userIdController.sink.add(valor);

  bool insertOrUpdate() {
    var meusdados = Meusdados()
      ..nome = _nome
      ..cpf = _cpf
      ..email = _email
      ..genero = _genero
      ..dddCelular = _dddCelular
      ..dddTelefone = _dddTelefone
      ..cep = _cep
      ..endereco = _endereco
      ..estado = _estado
      ..cidade = _cidade
      ..userId = _userId;

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
    _cpfController.close();
    _emailController.close();
    _generoController.close();
    _dddCelularController.close();
    _dddTelefoneController.close();
    _cepController.close();
    _enderecoController.close();
    _estadoController.close();
    _cidadeController.close();
    _userIdController.close();
    super.dispose();
  }
}
