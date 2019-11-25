import 'dart:core';
import 'dart:ffi';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:iMyPet/models/banhoETosa_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import 'banhoETosa_repository.dart';

class BanhoETosaBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<BanhoETosaRepository>();
  get banhoETosa => _repository.banhoETosa;

  // VacinasEdit
  String _documentId;
  String codigoPet;
  String codigoEmpresaPetshop;
  DateTime agendarDataHorario;
  String selecioneTipoServico;
  bool tosa;
  String informeTipoTosa;
  bool hidratacaoPelo;
  String tipoHidratacao;
  bool aplicarVermifugo;
  String tipoVermifugo;
  bool aplicarRemedioPulgas;
  String tipoRemedioPulga;
  bool telebusca;
  String informeLocalDeBuscaeEntrega;
  String observacao;
 Double valor;


  BanhoETosaBloc() {
    _codigoPetController.listen((value) => _codigoPet = value);
    _codigoEmpresaPetshopController.listen((value) => _codigoEmpresaPetshop = value);
    _agendarDataHorarioController.listen((value) => _agendarDataHorario = value);
 _selecioneTipoServicoController.listen((value) => _selecioneTipoServico = value);
  _tosaController.listen((value) => _tosa = value);
   _informeTipoTosaController.listen((value) => _informeTipoTosa = value);
    _hidratacaoPeloController.listen((value) => _hidratacaoPelo = value);
    _tipoHidratacaoController.listen((value) => _tipoHidratacao = value);
    _aplicarVermifugoController.listen((value) => _aplicarVermifugo = value);
    _tipoVermifugoController.listen((value) => _tipoVermifugo = value);
    _aplicarRemedioPulgasController.listen((value) => _aplicarRemedioPulgas = value);
    _tipoRemedioPulgaController.listen((value) => tipoRemedioPulga = value);
    _telebuscaController.listen((value) => _telebusca = value);
    _informeLocalDeBuscaeEntregaController.listen((value) => _informeLocalDeBuscaeEntrega = value);
    _observacaoController.listen((value) => _observacao = value);
    _ valorController.listen((value) => _valor = value);
 
  }


  void setBanhoETosa (BanhoETosa banhoETosa) {
    _documentId = banhoETosa.documentId();
    setCodigoPet(banhoETosa.codigoPet);
    setCodigoEmpresaPetshop(banhoETosa.codigoEmpresaPetshop);
    setAgendarDataHorario(banhoETosa.agendarDataHorario);
    setSelecioneTipoServico(banhoETosa.selecioneTipoServico);
    setTosa(banhoETosa.tosa);
    setInformeTipoTosa(banhoETosa.informeTipoTosa);
    setHidratacaoPelo(banhoETosa.hidratacaoPelo);
    setTipoHidratacao(banhoETosa.selecionetipoHidratacao);
    setAplicarVermifugo(banhoETosa.aplicarVermifugo);
    setTipoVermifugo(banhoETosa.tipoVermifugo);
    setAplicarRemedioPulgas(banhoETosa.aplicarRemedioPulgas);
    setipoRemedioPulga(banhoETosa.tipoRemedioPulga);
    setTelebusca(banhoETosa.telebusca);
    setInformeLocalDeBuscaeEntrega(banhoETosa.informeLocalDeBuscaeEntrega);
    setObservacao(banhoETosa.observacao);
    setValor(banhoETosa.valor);

  }

var _codigoPetController = BehaviorSubject<String>();
  Stream<String> get outCodigoPet => _codigoPetController.stream;
  void setCodigoPet(String valor) => _codigoPetController.sink.add(valor);

  var _codigoEmpresaPetshopController = BehaviorSubject<String>();
  Stream<String> get outCodigoEmpresaPetshop => _codigoEmpresaPetshopController.stream;
  void setCodigoEmpresaPetshop(String valor) => _codigoEmpresaPetshopController.sink.add(valor);

     var _agendarDataHorarioController = BehaviorSubject<DateTime>();
  Stream<DateTime> get outAgendarDataHorario =>
      _agendarDataHorarioController.stream;
  void setAgendarDataHorario(DateTime valor) =>
      _agendarDataHorarioController.sink.add(valor);

var _selecioneTipoServicoController = BehaviorSubject<String>();
  Stream<String> get outSelecioneTipoServico => _selecioneTipoServicoController.stream;
  void setSelecioneTipoServico(String valor) => _selecioneTipoServicoController.sink.add(valor);

      
  DateTime ;
  String ;
  bool tosa;
  String informeTipoTosa;
  bool hidratacaoPelo;
  String tipoHidratacao;
  bool aplicarVermifugo;
  String tipoVermifugo;
  bool aplicarRemedioPulgas;
  String tipoRemedioPulga;
  bool telebusca;
  String informeLocalDeBuscaeEntrega;
  String observacao;
  Double valor;

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
    var banhoETosa = BanhoETosa()
      ..codigoPet = _codigoPet
      ..codigoEmpresaPetshop = _codigoEmpresaPetshop
      ..agendarDataHorario = _agendarDataHorario
      ..selecioneTipoServico = _selecioneTipoServico
      ..tosa= _tosa
      ..informeTipoTosa = _informeTipoTosa
     ..hidratacaoPelo = hidratacaoPelo
      ..tipoHidratacao = tipoHidratacao
      
      ..aplicarVermifugo = _aplicarVermifugo
      ..tipoVermifugo = _tipoVermifugo
      ..vacinaId = _vacinaId
      ..vermifugoId = _vermifugoId
      ..vermifugos = _vermifugos;
aplicarRemedioPulgas
       String _documentId;
  String codigoPet;
  String ;
  DateTime ;
  String ;
  bool ;
  String ;
  bool ;
  String ;
  bool ;
  String ;
  bool ;
  String tipoRemedioPulga;
  bool telebusca;
  String informeLocalDeBuscaeEntrega;
  String observacao;
  Double valor;

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
