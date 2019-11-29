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

  String _documentId;
  String _codigoPet;
  String _codigoEmpresaPetshop;
  DateTime _agendarDataHorario;
  String _selecioneTipoServico;
  bool _tosa;
  String _informeTipoTosa;
  bool _hidratacaoPelo;
  String _tipoHidratacao;
  bool _aplicarVermifugo;
  String _tipoVermifugo;
  bool _aplicarRemedioPulgas;
  String _tipoRemedioPulga;
  bool _telebusca;
  String _informeLocalDeBuscaeEntrega;
  String _observacao;
  Double _valor;

  BanhoETosaBloc() {
    _codigoPetController.listen((value) => _codigoPet = value);
    _codigoEmpresaPetshopController
        .listen((value) => _codigoEmpresaPetshop = value);
    _agendarDataHorarioController
        .listen((value) => _agendarDataHorario = value);
    _selecioneTipoServicoContoller
        .listen((value) => _selecioneTipoServico = value);
    _tosaController.listen((value) => _tosa = value);
    _informeTipoTosaController.listen((value) => _informeTipoTosa = value);
    _hidratacaoPeloController.listen((value) => _hidratacaoPelo = value);
    _tipoHidratacaoController.listen((value) => _tipoHidratacao = value);
    _aplicarVermifugoController.listen((value) => _aplicarVermifugo = value);
    _tipoVermifugoController.listen((value) => _tipoVermifugo = value);
    _telebuscaController.listen((value) => _telebusca = value);
    _informeLocalDeBuscaeEntregaController
        .listen((value) => _informeLocalDeBuscaeEntrega = value);
    _observacaoController.listen((value) => _observacao = value);
    _valorController.listen((value) => _valor = value);

    // _userIdController.listen((value) => _userId = value);
  }

  void setBanhoETosa(BanhoETosa banhoETosa) {
    _documentId = banhoETosa.documentId();
    setCodigoPet(banhoETosa.codigoPet);
    setCodigoEmpresaPetshop(banhoETosa.codigoEmpresaPetshop);
    setAgendarDataHorario(banhoETosa.agendarDataHorario);
    setSelecioneTipoServico(banhoETosa.selecioneTipoServico);
    setTosa(banhoETosa.tosa);
    setInformeTipoTosa(banhoETosa.informeTipoTosa);
    setHidratacaoPelo(banhoETosa.hidratacaoPelo);
    setTipoHidratacao(banhoETosa.tipoHidratacao);
    setAplicarVermifugo(banhoETosa.aplicarVermifugo);
    setTipoVermifugo(banhoETosa.tipoVermifugo);
    setTelebusca(banhoETosa.telebusca);
    setInformeLocalDeBuscaeEntrega(banhoETosa.informeLocalDeBuscaeEntrega);
    setObservacao(banhoETosa.observacao);
    setValor(banhoETosa.valor);

   // setUserId(banhoETosa.userId);
  }

  var _codigoPetController = BehaviorSubject<String>();
  Stream<String> get outCodigoPet => _codigoPetController.stream;
  void setCodigoPet(String valor) => _codigoPetController.sink.add(valor);

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
  Stream<String> get outUserId => _userIdController.stream;
  void setUserId(String valor) => _userIdController.sink.add(valor);

  bool insertOrUpdate(String uid) {
    var banhoETosa = BanhoETosa()
      ..codigoPet = _codigoPet
      ..codigoEmpresaPetshop = _codigoPet
      ..email = _email
      ..genero = _genero
      ..dddCelular = _dddCelular
      ..dddTelefone = _dddTelefone
      ..cep = _cep
      ..endereco = _endereco
      ..estado = _estado
      ..cidade = _cidade
      ..userId = _userId.isEmpty ? uid : _userId;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(banhoETosa);
    } else {
      _repository.update(_documentId, banhoETosa);
    }

    return true;
  }

  void delete(String documentId) => _repository.delete(documentId);

  @override
  void dispose() {
    _codigoPetController.close();
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
