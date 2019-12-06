import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:iMyPet/models/pet_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import 'pet_repository.dart';

class PetBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<PetRepository>();
  get pet => _repository.pet;

  // PetEdit
  String _documentId;
  String _especie;
  String _nome;
  String _cor;
  double _peso;
  DateTime _dataNascimento;
  String _sexo;
  String _pelagem;
  String _observacao;
 bool _castrado;
  String _racaId;
  String  _userId;

  PetBloc() {
    _especieController.listen((value) => _especie = value);
    _nomeController.listen((value) => _nome = value);
    _racaIdController.listen((value) => _racaId = value);
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
    setRacaId(pet.racaId);
    setCor(pet.cor);
    setPeso(pet.peso);
    setDataNascimento(pet.dataNascimento);
    setSexo(pet.sexo);
    setPelagem(pet.pelagem);
    setPelagem(pet.castrado);
    setObservacao(pet.observacao);
    setRacaId(pet.racaId);
    
  }

  var _racaIdController = BehaviorSubject<String>();
  Stream<String> get outRacaId => _racaIdController.stream;
  String get outRacaIdValue => _racaIdController.stream.value;
  void setRacaId(String valor) => _racaIdController.sink.add(valor);

  var _especieController = BehaviorSubject<String>();
  Stream<String> get outEspecie => _especieController.stream;
  String get outEspecieValue => _especieController.stream.value;
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