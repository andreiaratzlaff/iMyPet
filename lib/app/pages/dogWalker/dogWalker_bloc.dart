import 'dart:core';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:iMyPet/models/dogWalker_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import 'dogWalker_repository.dart';

class DogWalkerBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<DogWalkerRepository>();
  get dogWalker=> _repository.dogWalker;

  // PetEdit
  String _documentId;
  String _petId;
  DateTime _dataEHorarioInicioPasseio;
  DateTime _dataEHorarioFimPasseio;
  bool _vacinacaoEmDia;
  bool _possuiAlgumaRestricao;
  String _informeARestricao;  
  bool _telebusca;
  String _observacao;
  String _empresaId;
  String _informeLocalTelebusca;

  DogWalkerBloc() {
    _petIdController.listen((value) => _petId = value);
    _dataEHorarioInicioPasseioController.listen((value) => _dataEHorarioInicioPasseio = value);
    _dataEHorarioFimPasseioController.listen((value) => _dataEHorarioFimPasseio = value);
 //  _vacinacaoEmDiaController.listen((value) => _vacinacaoEmDia = value);
   // _possuiAlgumaRestricaoController.listen((value) => _possuiAlgumaRestricao = value);
    //_telebuscaController.listen((value) => _telebusca = value);
    _empresaIdController.listen((value) => _empresaId = value);
    _observacaoController.listen((value) => _observacao = value);
   // _informeLocalTelebuscaController.listen((value) => _informeLocalTelebuscaController = value);
  }

  void setDogWalker(DogWalker dogWalker) {
    _documentId = dogWalker.documentId();
    setPetId(dogWalker.petId);
    setDataEHorarioInicioPasseio(dogWalker.dataEHorarioInicioPasseio);
    setDataEHorarioFimPasseio(dogWalker.dataEHorarioFimPasseio);
  //  setvacinacaoEmDia(dogWalker.vacinacaoEmDia);
  //  setPossuiAlgumaRestricao(dogWalker.possuiAlgumaRestricao);
   // settelebusca(dogWalker.telebusca);
    setEmpresaId(dogWalker.empresaId);
    setObservacao(dogWalker.observacao);
     setInformeLocalTelebusca(dogWalker.informeLocalTelebusca);
       
  }

  var _petIdController = BehaviorSubject<String>();
  Stream<String> get outPetId => _petIdController.stream;
  String get outPetIdValue => _petIdController.stream.value;
  void setPetId(String valor) => _petIdController.sink.add(valor);

 var _dataEHorarioInicioPasseioController = BehaviorSubject<DateTime>();
  Stream<DateTime> get outDataEHorarioInicioPasseio => _dataEHorarioInicioPasseioController.stream;
  void setDataEHorarioInicioPasseio(DateTime valor) =>
      _dataEHorarioInicioPasseioController.sink.add(valor);

  var _dataEHorarioFimPasseioController = BehaviorSubject<DateTime>();
  Stream<DateTime> get outDataEHorarioFimPasseio => _dataEHorarioFimPasseioController.stream;
  void setDataEHorarioFimPasseio(DateTime valor) =>
      _dataEHorarioFimPasseioController.sink.add(valor);

  var _empresaIdController = BehaviorSubject<String>();
  Stream<String> get outEmpresaId => _empresaIdController.stream;
  void setEmpresaId(String valor) => _empresaIdController.sink.add(valor);

var _observacaoController = BehaviorSubject<String>();
  Stream<String> get outObservacao => _observacaoController.stream;
  void setObservacao(String valor) => _observacaoController.sink.add(valor);

  var _informeLocalTelebuscaController = BehaviorSubject<String>();
  Stream<String> get outInformeLocalTelebusca => _informeLocalTelebuscaController.stream;
  void setInformeLocalTelebusca(String valor) => _informeLocalTelebuscaController.sink.add(valor);
  

  bool insertOrUpdate() {
    var dogWalker = DogWalker()
      ..petId = _petId
      ..empresaId = _empresaId
      ..dataEHorarioInicioPasseio = _dataEHorarioInicioPasseio
      ..dataEHorarioFimPasseio = _dataEHorarioFimPasseio
      ..vacinacaoEmDia = _vacinacaoEmDia
       ..possuiAlgumaRestricao = _possuiAlgumaRestricao
       ..informeARestricao = _informeARestricao
       ..telebusca = _telebusca
        ..observacao = _observacao
        ..informeLocalTelebusca = _informeLocalTelebusca;
     
     // ..userId = _userId.isEmpty? uid: _userId

    if (_documentId?.isEmpty ?? true) {
      _repository.add(dogWalker);
    } else {
      _repository.update(_documentId, dogWalker);
    }

    return true;
  }

  void delete(String documentId) => _repository.delete(documentId);

   @override
  void dispose() {
    _petIdController.close();
     _empresaIdController.close();
    _dataEHorarioInicioPasseioController.close();
    _dataEHorarioFimPasseioController.close();
   //_vacinacaoEmDiaController.close();
  // _possuiAlgumaRestricaoController.close();

  //  _telebuscaController.close();
     _informeLocalTelebuscaController.close();
    _observacaoController.close();
    super.dispose();
  }
}

