import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class CarteiraVacina extends ModeloBase {
  String _documentId;
  DateTime validade;
  String codigoPet;
  DateTime dataAplicacao;
  DateTime dataProximaAplicacao;
  bool eNecessarioRevacinar;
  String fabricante;
  String lembrete;
  String nomePet;
  String observacao;
  int peso;
  String vacina;
  String vacinaId;
  String vermifugoId;
  String vermifugos;

  CarteiraVacina();

  CarteiraVacina.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;

    this.validade = getDateTime(documento.data["validade"]);
    this.codigoPet = documento.data["codigoPet"];
    this.dataAplicacao = getDateTime(documento.data["dataAplicacao"]);
    this.dataProximaAplicacao =
        getDateTime(documento.data["dataProximaAplicacao"]);
    this.eNecessarioRevacinar = documento.data["eNecessarioRevacinar"];
    this.fabricante = documento.data["fabricante"];
    this.lembrete = documento.data["lembrete"];
    this.nomePet = documento.data["nomePet"];
    this.observacao = documento.data["observacao"];
    this.peso = documento.data["peso"];
    this.vacina = documento.data["vacina"];
    this.vacinaId = documento.data["vacinaId"];
    this.vermifugoId = documento.data["vermifugoId"];
    this.vermifugos = documento.data["vermifugos"];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();

    map['validade'] = this.validade;
    map['codigoPet'] = this.codigoPet;
    map['dataAplicacao'] = this.dataAplicacao;
    map['dataProximaAplicacao'] = this.dataProximaAplicacao;
    map['eNecessarioRevacinar'] = this.eNecessarioRevacinar;
    map['fabricante'] = this.fabricante;
    map['lembrete'] = this.lembrete;
    map['nomePet'] = this.nomePet;
    map['observacao'] = this.observacao;
    map['peso'] = this.peso;
    map['vacina'] = this.vacina;
    map['vacinaId'] = this.vacinaId;
    map['vermifugoId'] = this.vermifugoId;
    map['vermifugos'] = this.vermifugos;

    return map;
  }

  @override
  String documentId() => _documentId;

  DateTime getDateTime(Timestamp data) {
    return DateTime.fromMillisecondsSinceEpoch(data.millisecondsSinceEpoch);
  }
}
