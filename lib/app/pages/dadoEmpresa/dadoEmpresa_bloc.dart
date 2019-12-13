import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:iMyPet/models/dadoEmpresa_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import 'dadoEmpresa_repository.dart';

class DadoEmpresaBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<DadoEmpresaRepository>();
  get dadoEmpresa=> _repository.dadoEmpresa;

  // PetEdit
  String _documentId;
  String razaoSocial;
  String nome;
  String paginaFacebookInstagram;
  String email;
  String dddCelular;
  String dddTelefone;
  String cep;
  String endereco;
  String cidade;
  String estado;
  String especialidadeId;
   String  _userId;

  DadoEmpresaBloc() {
    _razaoSocialController.listen((value) => _razaoSocial = value);
    _nomeController.listen((value) => _nome = value);
    _paginaFacebookInstagramController.listen((value) => _paginaFacebookInstagram = value);
    _emailController.listen((value) => _email = value);
    _dddCelularController.listen((value) => _dddCelular = value);
    _dddTelefoneController.listen((value) => _dddTelefone = value);
    _enderecoController.listen((value) => _endereco = value);
    _cidadeController.listen((value) => _cidade = value);
    _estadoController.listen((value) => _estado = value);
    _especialidadeIdController.listen((value) => _especialidadeId = value);
  }

  void setDadoEmpresa(DadoEmpresa dadoEmpresa) {
    _documentId = DadoEmpresa.documentId();
    setRazaoSocial(dadoEmpresa.razaoSocial);
    setNome(dadoEmpresa.nome);
    setPaginaFacebookInstagram(dadoEmpresa.paginaFacebookInstagram);
    setEmail(dadoEmpresa.email);
    setDddCelular(dadoEmpresa.dddCelular);
    setDddTelefone(dadoEmpresa.dddTelefone);
    setEndereco(dadoEmpresa.endereco);
    setCidade(dadoEmpresa.cidade);
    setEstado(dadoEmpresa.estado);
    setEspecialidadeId(dadoEmpresa.especialidadeId);
  
    
  }

  var _especialidadeIdController = BehaviorSubject<String>();
  Stream<String> get outEspecialidadeId => _especialidadeIdController.stream;
  String get outEspecialidadeIdValue => _especialidadeIdController.stream.value;
  void setEspecialidadeId(String valor) => _especialidadeIdController.sink.add(valor);


    var _razaoSocialController = BehaviorSubject<String>();
  Stream<String> get outRazaoSocial => _razaoSocialController.stream;
  void setRazaoSocial(String valor) => _razaoSocialController.sink.add(valor);

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;
  void setNome(String valor) => _nomeController.sink.add(valor);


  var _pesoController = BehaviorSubject<double>();
  Stream<double> get outPeso => _pesoController.stream;
  void setPeso(double valor) => _pesoController.sink.add(valor);

  var _dataNascimentoController = BehaviorSubject<DateTime>();
  Stream<DateTime> get outDataNascimento => _dataNascimentoController.stream;
  void setDataNascimento(DateTime valor) =>
      _dataNascimentoController.sink.add(valor);

  var _sexoController = BehaviorSubject<String>(); 
  Stream<String> get outSexo => _sexoController.stream;
  String get outSexoValue => _sexoController.stream.value;
  void setSexo(String valor) => _sexoController.sink.add(valor);

  var _pelagemController = BehaviorSubject<String>();
  Stream<String> get outPelagem => _pelagemController.stream;
  void setPelagem(String valor) => _pelagemController.sink.add(valor);

  var _observacaoController = BehaviorSubject<String>();
  Stream<String> get outObservacao => _observacaoController.stream;
  void setObservacao(String valor) => _observacaoController.sink.add(valor);

  bool insertOrUpdate() {
    var pet = Pet()
      ..racaId = _racaId
      ..especie = _especie
      ..nome = _nome
      ..cor = _cor
      ..peso = _peso
      ..dataNascimento = _dataNascimento
      ..sexo = _sexo
      ..pelagem = _pelagem
      ..observacao = _observacao;
     // ..userId = _userId.isEmpty? uid: _userId

    if (_documentId?.isEmpty ?? true) {
      _repository.add(pet);
    } else {
      _repository.update(_documentId, pet);
    }

    return true;
  }

  void delete(String documentId) => _repository.delete(documentId);

   @override
  void dispose() {
    _racaIdController.close();
    _nomeController.close();
    _especieController.close();
    _corController.close();
    _pesoController.close();
    _dataNascimentoController.close();
    _sexoController.close();
    _pelagemController.close();
    _observacaoController.close();
    super.dispose();
  }
}