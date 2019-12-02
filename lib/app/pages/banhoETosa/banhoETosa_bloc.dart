import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:iMyPet/models/banhoETosa_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import 'banhoETosa_repository.dart';

class BanhoETosaBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<BanhoETosaRepository>();
  get banhoETosa => _repository.banhoETosa;

  // BanhoETosaEdit
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

 BanhoETosaBloc() {
     _codigoPetController.listen((value) => _codigoPet = value);
     _codigoEmpresaPetshopController.listen((value) => _codigoEmpresaPetshop = value);
     _agendarDataHorarioController.listen((value) => _agendarDataHorario = value);
    _selecioneTipoServicoController.listen((value) => _selecioneTipoServico = value);
       _tosaController.listen((value) => _tosa = value);
   _informeTipoTosaController.listen((value) => _informeTipoTosa = value);
   _hidratacaoPeloController.listen((value) => _hidratacaoPelo = value);
    _aplicarVermifugoController.listen((value) => _aplicarVermifugo = value);
  _tipoVermifugoController.listen((value) => _tipoVermifugo = value);
   _aplicarRemedioPulgasController.listen((value) => _aplicarRemedioPulgas = value);
   _tipoRemedioPulgaController.listen((value) => _tipoRemedioPulga = value);
   _telebuscaController.listen((value) => _telebusca = value);
  _informeLocalDeBuscaeEntregaController.listen((value) => _informeLocalDeBuscaeEntrega = value);
   _observacaoController.listen((value) => _observacao = value);
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
    setAplicarRemedioPulgas(banhoETosa.aplicarRemedioPulgas);
    setTipoRemedioPulga(banhoETosa.tipoRemedioPulga);
    setTelebusca(banhoETosa.telebusca);
    setInformeLocalDeBuscaeEntrega(banhoETosa.informeLocalDeBuscaeEntrega);
    setObservacao(banhoETosa.observacao);
  }

 var _codigoPetController = BehaviorSubject<String>();
  Stream<String> get outCodigoPet => _codigoPetController.stream;
  void setCodigoPet(String valor) => _codigoPetController.sink.add(valor);

  var _codigoEmpresaPetshopController = BehaviorSubject<String>();
  Stream<String> get outCodigoEmpresaPetshop => _codigoEmpresaPetshopController.stream;
  void setCodigoEmpresaPetshop(String valor) => _codigoEmpresaPetshopController.sink.add(valor);

  var _agendarDataHorarioController = BehaviorSubject<DateTime>();
  Stream<DateTime> get outAgendarDataHorario=> _agendarDataHorarioController.stream;
  void setAgendarDataHorario(DateTime valor) =>
      _agendarDataHorarioController.sink.add(valor);

 var _selecioneTipoServicoController = BehaviorSubject<String>();
  Stream<String> get outSelecioneTipoServico => _selecioneTipoServicoController.stream;
  void setSelecioneTipoServico(String valor) => _selecioneTipoServicoController.sink.add(valor);

   var _tosaController = BehaviorSubject<bool>();
  Stream<bool> get outTosa =>
      _tosaController.stream;
  void setTosa(bool valor) =>
      _tosaController.sink.add(valor);

 var _informeTipoTosaController = BehaviorSubject<String>();
  Stream<String> get outInformeTipoTosa => _informeTipoTosaController.stream;
  void setInformeTipoTosa(String valor) => _informeTipoTosaController.sink.add(valor);

   var _hidratacaoPeloController = BehaviorSubject<bool>();
  Stream<bool> get outHidratacaoPelo =>
      _tosaController.stream;
  void setHidratacaoPelo(bool valor) =>
      _hidratacaoPeloController.sink.add(valor);

var _tipoHidratacaoController = BehaviorSubject<String>();
  Stream<String> get outTipoHidratacao => _tipoHidratacaoController.stream;
  void setTipoHidratacao(String valor) => _tipoHidratacaoController.sink.add(valor);

   var _aplicarVermifugoController = BehaviorSubject<bool>();
  Stream<bool> get outAplicarVermifugo =>
      _tosaController.stream;
  void setAplicarVermifugo(bool valor) =>
      _aplicarVermifugoController.sink.add(valor);

var _tipoVermifugoController = BehaviorSubject<String>();
  Stream<String> get outTipoVermifugo => _tipoVermifugoController.stream;
  void setTipoVermifugo(String valor) => _tipoVermifugoController.sink.add(valor);

 var _aplicarRemedioPulgasController = BehaviorSubject<bool>();
  Stream<bool> get outAplicarRemedioPulgas =>
      _tosaController.stream;
  void setAplicarRemedioPulgas(bool valor) =>
      _aplicarRemedioPulgasController.sink.add(valor);

var _tipoRemedioPulgaController = BehaviorSubject<String>();
  Stream<String> get outTipoRemedioPulga => _tipoRemedioPulgaController.stream;
  void setTipoRemedioPulga(String valor) => _tipoRemedioPulgaController.sink.add(valor);

 var _telebuscaController = BehaviorSubject<bool>();
  Stream<bool> get outTelebusca =>
      _telebuscaController.stream;
  void setTelebusca(bool valor) =>
      _telebuscaController.sink.add(valor);

var _informeLocalDeBuscaeEntregaController = BehaviorSubject<String>();
  Stream<String> get outInformeLocalDeBuscaeEntrega => _informeLocalDeBuscaeEntregaController.stream;
  void setInformeLocalDeBuscaeEntrega(String valor) => _informeLocalDeBuscaeEntregaController.sink.add(valor);

var _observacaoController = BehaviorSubject<String>();
  Stream<String> get outObservacao => _observacaoController.stream;
  void setObservacao(String valor) => _observacaoController.sink.add(valor);

  
  bool insertOrUpdate() {
    var banhoETosa = BanhoETosa()
     ..codigoPet = _codigoPet
     ..codigoEmpresaPetshop = _codigoEmpresaPetshop
     ..agendarDataHorario = _agendarDataHorario
     ..selecioneTipoServico = _selecioneTipoServico
     ..tosa = _tosa
     ..informeTipoTosa = _informeTipoTosa
     ..hidratacaoPelo = _hidratacaoPelo
     ..tipoHidratacao = _tipoHidratacao
     ..aplicarVermifugo = _aplicarVermifugo
     ..tipoVermifugo = _tipoVermifugo
     ..aplicarRemedioPulgas = _aplicarRemedioPulgas
     ..tipoRemedioPulga = _tipoRemedioPulga
     ..telebusca = _telebusca
     ..informeLocalDeBuscaeEntrega = _informeLocalDeBuscaeEntrega
     ..observacao = _observacao;
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
    super.dispose();
  }
}

