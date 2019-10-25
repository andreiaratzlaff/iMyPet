import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imypet/shared/base_model.dart';

class Pet extends BaseModel{
String _documentId;
String cadastro;
String cor;
DateTime dataNascimento;
String especie;
String nome;
String observacao;
String pelagem;
Double peso;
String raca;
String sexo;
String proprietario_id;

Pet();

  @override
  String documentId() {
    // TODO: implement documentId
    return documentId();
  }

  @override
  toMap() {
    // TODO: implement toMap

    var mapa = new Map<String, dynamic>();
  
mapa ['cadastro'] = this.cadastro;
mapa ['cor'] = this.cor;
mapa ['dataNascimento'] = this.dataNascimento;
mapa ['especie'] = this.especie;
mapa ['nome'] = this.nome;
mapa ['observacao'] = this.observacao;
mapa ['pelagem'] = this.pelagem;
mapa ['peso'] = this.peso;
mapa ['raca'] = this.raca;
mapa ['sexo'] = this.sexo;
mapa ['proprietario_id'] = this.proprietario_id;



  
    return mapa;
  }

Pet.fromMap(DocumentSnapshot documento){
  _documentId = documento.documentID;
  this.cadastro = documento.data['cadastro'];
  this.cor = documento.data['cor'];
  //definicao data
  Timestamp ts = documento.data ['dataNascimento'];
  this.dataNascimento=
  DateTime.fromMillisecondsSinceEpoch(ts.microsecondsSinceEpoch);
  
  this.especie = documento.data['especie'];
  this.nome = documento.data['nome'];
  this.observacao = documento.data['observacao'];
  this.pelagem = documento.data['pelagem'];
  this.peso = documento.data['peso'];
  this.raca = documento.data['raca'];
  this.sexo = documento.data['sexo'];
  this.proprietario_id = documento.data['proprietario_id'];

}

}