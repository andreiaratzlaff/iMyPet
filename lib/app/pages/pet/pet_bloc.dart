import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:iMyPet/models/pet_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import 'pet_repository.dart';

class PetBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<PetRepository>();
  get pet => _repository.pet;

  // PetEdit
  String _codigoPet;
  String _documentId;
  String _especie;
  String _nome;
  String _cor;
  double _peso;
  DateTime _dataNascimento;
  String _sexo;
  String _pelagem;
  String _observacao;
  String  _userId;

  PetBloc() {
    _codigoPetController.listen((value) => _codigoPet = value);
    _especieController.listen((value) => _especie = value);
    _nomeController.listen((value) => _nome = value);
    _corController.listen((value) => _cor = value);
    _pesoController.listen((value) => _peso = value);
    _dataNascimentoController.listen((value) => _dataNascimento = value);
    _sexoController.listen((value) => _sexo = value);
    _pelagemController.listen((value) => _pelagem = value);
    _observacaoController.listen((value) => _observacao = value);
  }

  void setPet(Pet pet) {
    _documentId = pet.documentId();
    setEspecie(pet.especie);
    setNome(pet.nome);
    setCor(pet.cor);
    setPeso(pet.peso);
    setDataNascimento(pet.dataNascimento);
    setSexo(pet.sexo);
    setPelagem(pet.pelagem);
    setObservacao(pet.observacao);
  }

  var _codigoPetController = BehaviorSubject<String>();
  Stream<String> get outCodigoPet => _codigoPetController.stream;
  void setCodigoPet(String valor) => _codigoPetController.sink.add(valor);

  var _especieController = BehaviorSubject<String>();
  Stream<String> get outEspecie => _especieController.stream;
  void setEspecie(String valor) => _especieController.sink.add(valor);

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;
  void setNome(String valor) => _nomeController.sink.add(valor);

  var _corController = BehaviorSubject<String>();
  Stream<String> get outCor => _corController.stream;
  void setCor(String valor) => _corController.sink.add(valor);

  var _pesoController = BehaviorSubject<double>();
  Stream<double> get outPeso => _pesoController.stream;
  void setPeso(double valor) => _pesoController.sink.add(valor);

  var _dataNascimentoController = BehaviorSubject<DateTime>();
  Stream<DateTime> get outDataNascimento => _dataNascimentoController.stream;
  void setDataNascimento(DateTime valor) =>
      _dataNascimentoController.sink.add(valor);

  var _sexoController = BehaviorSubject<String>(); 
  Stream<String> get outSexo => _sexoController.stream;
  void setSexo(String valor) => _sexoController.sink.add(valor);

  var _pelagemController = BehaviorSubject<String>();
  Stream<String> get outPelagem => _pelagemController.stream;
  void setPelagem(String valor) => _pelagemController.sink.add(valor);

  var _observacaoController = BehaviorSubject<String>();
  Stream<String> get outObservacao => _observacaoController.stream;
  void setObservacao(String valor) => _observacaoController.sink.add(valor);

  bool insertOrUpdate() {
    var pet = Pet()
     // ..codigoPet = _codigoPet
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
    _codigoPetController.close();
    _nomeController.close();
    _corController.close();
    _pesoController.close();
    _dataNascimentoController.close();
    _sexoController.close();
    _pelagemController.close();
    _observacaoController.close();
    super.dispose();
  }
}


