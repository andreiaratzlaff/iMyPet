
import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class Pet extends ModeloBase {
  String _documentId;
  String especie;
  String nome;
  String cor;
  double peso;
  DateTime dataNascimento;
  String sexo;
  String pelagem;
  String castrado;
  String observacao;
  String raca_id;


  Pet();

  Pet.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;
    this.especie = documento.data["especie"]; 
    this.nome = documento.data["nome"];
    this.cor = documento.data["cor"];
    this.peso = documento.data["peso"];

    Timestamp ts = documento.data["dataNascimento"];

    this.dataNascimento = DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch);
    this.sexo = documento.data["sexo"];
    this.pelagem = documento.data["pelagem"];
    this.castrado = documento.data["castrado"];
    this.observacao = documento.data["observacao"];
    this.raca_id = documento.data["raca_id"];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['especie'] = this.especie;
    map['nome'] = this.nome;
    map['cor'] = this.cor;
    map['peso'] = this.peso;
    map['dataNascimento'] = this.dataNascimento;
    map['sexo'] = this.sexo;
    map['pelagem'] = this.pelagem;
    map['castrado'] = this.castrado;
    map['observacao'] = this.observacao;

    return map;
  }

  @override
  String documentId() => _documentId;
}
