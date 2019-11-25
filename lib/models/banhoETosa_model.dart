import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class BanhoETosa extends ModeloBase {
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

  BanhoETosa();

  BanhoETosa.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;
    this.codigoPet = documento.data["codigoPet"];
    this.codigoEmpresaPetshop = documento.data["codigoEmpresaPetshop"];
    this.agendarDataHorario = getDateTime(documento.data["agendarDataHorario"]);
    this.selecioneTipoServico = documento.data["selecioneTipoServico"];
    this.tosa = documento.data["tosa"];
    this.informeTipoTosa = documento.data["informeTipoTosa"];
    this.hidratacaoPelo = documento.data["hidratacaoPelo"];
    this.tipoHidratacao = documento.data["hidratacaoPelohidratacaoPelohidratacaoPelo"];
    this.aplicarVermifugo = documento.data["aplicarVermifugo"];
    this.tipoVermifugo = documento.data["tipoVermifugo"];
    this.aplicarRemedioPulgas = documento.data["aplicarRemedioPulgas"];
    this.tipoRemedioPulga = documento.data["tipoRemedioPulga"];
    this.telebusca = documento.data["telebusca"];
    this.informeLocalDeBuscaeEntrega =
        documento.data["informeLocalDeBuscaeEntrega"];
    this.observacao = documento.data["observacao"];
    this.valor = documento.data["valor"];

      }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['codigoPet'] = this.codigoPet;
    map['codigoEmpresaPetshop'] = this.codigoEmpresaPetshop;
    map['agendarDataHorario'] = this.agendarDataHorario;
    map['selecioneTipoServico'] = this.selecioneTipoServico;
    map['tosa'] = this.tosa;
    map['informeTipoTosa'] = this.informeTipoTosa;
    map['hidratacaoPelo'] = this.hidratacaoPelo;
    map['hidratacaoPelo'] = this.hidratacaoPelo;
    map['aplicarRemedioPulgas'] = this.aplicarRemedioPulgas;
    map['tipoVermifugo'] = this.tipoVermifugo;
    map['aplicarRemedioPulgas'] = this.aplicarRemedioPulgas;
    map['tipoRemedioPulga'] = this.tipoRemedioPulga;
    map['telebusca'] = this.telebusca;
    map['informeLocalDeBuscaeEntrega'] = this.informeLocalDeBuscaeEntrega;
    map['observacao'] = this.observacao;
    map['valor'] = this.valor;

    return map;
  }

  @override
  String documentId() => _documentId;

  DateTime getDateTime(Timestamp data) {
    return DateTime.fromMillisecondsSinceEpoch(data.millisecondsSinceEpoch);
  }
}
