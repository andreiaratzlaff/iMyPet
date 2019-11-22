import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class CarteiraVacina extends ModeloBase {
  String _documentId;
<<<<<<< HEAD
  String codigoPet;
  String nomePet;
  int peso;
  String vacinaId;
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
=======
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
>>>>>>> d1f0c6d65c3c11830a19ae8dc3e6aa856dc029fb

  CarteiraVacina();

  CarteiraVacina.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;

<<<<<<< HEAD
    this.codigoPet = documento.data["codigoPet"];
    this.nomePet = documento.data["nomePet"];
    this.peso = documento.data["peso"];
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
=======
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
>>>>>>> d1f0c6d65c3c11830a19ae8dc3e6aa856dc029fb
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
<<<<<<< HEAD
    map['codigoPet'] = this.codigoPet;
    map['nomePet'] = this.nomePet;
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
=======

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
>>>>>>> d1f0c6d65c3c11830a19ae8dc3e6aa856dc029fb

    return map;
  }

  @override
  String documentId() => _documentId;

  DateTime getDateTime(Timestamp data) {
    return DateTime.fromMillisecondsSinceEpoch(data.millisecondsSinceEpoch);
  }
}
