import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:iMyPet/models/carteiravacina_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import 'carteiravacina_repository.dart';

class CarteiraVacinaBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<CarteiraVacinaRepository>();
  get carteiraVacina => _repository.carteiraVacina;

  // VacinasEdit
  String _documentId;
  DateTime _validade;
  String _codigoPet;
  DateTime _dataAplicacao;
  DateTime _dataProximaAplicacao;
  bool _eNecessarioRevacinar;
  String _fabricante;
  String _lembrete;
  String _nomePet;
  String _observacao;
  int _peso;
  String _vacina;
  String _vacinaId;
  String _vermifugoId;
  String _vermifugos;
   String _petId;

  CarteiraVacinaBloc() {
    _validadeController.listen((value) => _validade = value);
    _codigoPetController.listen((value) => _codigoPet = value);
    _dataAplicacaoController.listen((value) => _dataAplicacao = value);
    _dataProximaAplicacaoController
        .listen((value) => _dataProximaAplicacao = value);
    _eNecessarioRevacinarController
        .listen((value) => _eNecessarioRevacinar = value);
    _fabricanteController.listen((value) => _fabricante = value);
    _lembreteController.listen((value) => _lembrete = value);
    _nomePetController.listen((value) => _nomePet = value);
    _observacaoController.listen((value) => _observacao = value);
    _pesoController.listen((value) => _peso = value);
    _vacinaController.listen((value) => _vacina = value);
    _vacinaIdController.listen((value) => _vacinaId = value);
    _vermifugoIdController.listen((value) => _vermifugoId = value);
        _petIdController.listen((value) => _petId = value);
    _vermifugosController.listen((value) => _vermifugos = value);
  }

  void setCarteiraVacina(CarteiraVacina carteiraVacina) {
    _documentId = carteiraVacina.documentId();
    setValidade(carteiraVacina.validade);
    setCodigoPet(carteiraVacina.codigoPet);
    setDataAplicacao(carteiraVacina.dataAplicacao);
    setDataProximaAplicacao(carteiraVacina.dataProximaAplicacao);
    setENecessarioRevacinar(carteiraVacina.eNecessarioRevacinar);
    setFabricante(carteiraVacina.fabricante);
    setLembrete(carteiraVacina.lembrete);
    setNomePet(carteiraVacina.nomePet);
    setObservacao(carteiraVacina.observacao);
    setPeso(carteiraVacina.peso);
    setVacina(carteiraVacina.vacina);
    setVacinaId(carteiraVacina.vacinaId);
    setVermifugoId(carteiraVacina.vermifugoId);
    //setpetId(carteiraVacina.petId);
    setVermifugos(carteiraVacina.vermifugos);
  }

  var _validadeController = BehaviorSubject<DateTime>();
  Stream<DateTime> get outValidade => _validadeController.stream;
  void setValidade(DateTime valor) => _validadeController.sink.add(valor);

  var _codigoPetController = BehaviorSubject<String>();
  Stream<String> get outCodigoPet => _codigoPetController.stream;
  void setCodigoPet(String valor) => _codigoPetController.sink.add(valor);


    var _petIdController = BehaviorSubject<String>();
  Stream<String> get outPetID => _codigoPetController.stream;
  void setPetId(String valor) => _petIdController.sink.add(valor);

  var _dataAplicacaoController = BehaviorSubject<DateTime>();
  Stream<DateTime> get outDataAplicacao => _dataAplicacaoController.stream;
  void setDataAplicacao(DateTime valor) =>
      _dataAplicacaoController.sink.add(valor);

  var _dataProximaAplicacaoController = BehaviorSubject<DateTime>();
  Stream<DateTime> get outDataProximaAplicacao =>
      _dataProximaAplicacaoController.stream;
  void setDataProximaAplicacao(DateTime valor) =>
      _dataProximaAplicacaoController.sink.add(valor);

  var _eNecessarioRevacinarController = BehaviorSubject<bool>();
  Stream<bool> get outENecessarioRevacinar =>
      _eNecessarioRevacinarController.stream;
  void setENecessarioRevacinar(bool valor) =>
      _eNecessarioRevacinarController.sink.add(valor);

  var _fabricanteController = BehaviorSubject<String>();
  Stream<String> get outFabricante => _fabricanteController.stream;
  void setFabricante(String valor) => _fabricanteController.sink.add(valor);

  var _lembreteController = BehaviorSubject<String>();
  Stream<String> get outLembrete => _lembreteController.stream;
  void setLembrete(String valor) => _lembreteController.sink.add(valor);

  
  var _nomePetController = BehaviorSubject<String>();
  Stream<String> get outNomePet => _nomePetController.stream;
  void setNomePet(String valor) => _nomePetController.sink.add(valor);

  var _observacaoController = BehaviorSubject<String>();
  Stream<String> get outObservacao => _observacaoController.stream;
  void setObservacao(String valor) => _observacaoController.sink.add(valor);

  var _pesoController = BehaviorSubject<int>();
  Stream<int> get outPeso => _pesoController.stream;
  void setPeso(int valor) => _pesoController.sink.add(valor);

  var _vacinaController = BehaviorSubject<String>();
  Stream<String> get outVacina => _vacinaController.stream;
  void setVacina(String valor) => _vacinaController.sink.add(valor);

  var _vacinaIdController = BehaviorSubject<String>();
  Stream<String> get outVacinaId => _vacinaIdController.stream;
  void setVacinaId(String valor) => _vacinaIdController.sink.add(valor);

  var _vermifugoIdController = BehaviorSubject<String>();
  Stream<String> get outVermifugoId => _vermifugoIdController.stream;
  void setVermifugoId(String valor) => _vermifugoIdController.sink.add(valor);

  var _vermifugosController = BehaviorSubject<String>();
  Stream<String> get outVermifugos => _vermifugosController.stream;
  void setVermifugos(String valor) => _vermifugosController.sink.add(valor);

  bool insertOrUpdate() {
    var carteiraVacina = CarteiraVacina()
      ..validade = _validade
      ..codigoPet = _codigoPet
      ..dataAplicacao = _dataAplicacao
      ..dataProximaAplicacao = _dataProximaAplicacao
      ..eNecessarioRevacinar = _eNecessarioRevacinar
      ..fabricante = _fabricante
      ..lembrete = _lembrete
      ..nomePet = _nomePet
      ..petId = _petId
      ..observacao = _observacao
      ..peso = _peso
      ..vacina = _vacina
      ..vacinaId = _vacinaId
      ..vermifugoId = _vermifugoId
      ..vermifugos = _vermifugos;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(carteiraVacina);
    } else {
      _repository.update(_documentId, carteiraVacina);
    }

    return true;
  }

  void delete(String documentId) => _repository.delete(documentId);

  @override
  void dispose() {
    super.dispose();
  }
}
