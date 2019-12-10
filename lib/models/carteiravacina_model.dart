import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class CarteiraVacina extends ModeloBase {
  String _documentId;
  String codigoPet;
  String nomePet;
  int peso;
  String vacinaId;
  String petId;
  String vacina;
  String fabricante;
  DateTime validade;
  DateTime dataAplicacao;
  bool eNecessarioRevacinar;
  DateTime dataProximaAplicacao;
  String vermifugoId;
  String vermifugos;
  String lembrete;
  String observacao;

  CarteiraVacina();

  CarteiraVacina.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;

    this.codigoPet = documento.data["codigoPet"];
    this.nomePet = documento.data["nomePet"];
    this.peso = documento.data["peso"];
    this.petId = documento.data["petId"];
    this.vacinaId = documento.data["vacinaId"];
    this.vacina = documento.data["vacina"];
    this.validade = getDateTime(documento.data["validade"]);
    this.dataAplicacao = getDateTime(documento.data["dataAplicacao"]);
    this.eNecessarioRevacinar = documento.data["eNecessarioRevacinar"];
    this.dataProximaAplicacao =
        getDateTime(documento.data["dataProximaAplicacao"]);
   this.fabricante = documento.data["fabricante"];
    this.vermifugoId = documento.data["vermifugoId"];
    this.vermifugos = documento.data["vermifugos"];
    this.lembrete = documento.data["lembrete"];
    this.observacao = documento.data["observacao"];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['codigoPet'] = this.codigoPet;
    map['nomePet'] = this.nomePet;
    map['petId'] = this.petId;
    map['peso'] = this.peso;
    map['vacinaId'] = this.vacinaId;
    map['vacina'] = this.vacina;
    map['fabricante'] = this.fabricante;
    map['validade'] = this.validade;
    map['dataAplicacao'] = this.dataAplicacao;
    map['eNecessarioRevacinar'] = this.eNecessarioRevacinar;
    map['dataProximaAplicacao'] = this.dataProximaAplicacao;
    map['vermifugoId'] = this.vermifugoId;
    map['vermifugos'] = this.vermifugos;
    map['lembrete'] = this.lembrete;
    map['observacao'] = this.observacao;

    return map;
  }

  @override
  String documentId() => _documentId;

  DateTime getDateTime(Timestamp data) {
    return DateTime.fromMillisecondsSinceEpoch(data.millisecondsSinceEpoch);
  }
}
