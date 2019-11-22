<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class Meusdados extends ModeloBase {
  String _documentId;
  String nome;
  String cpf;
  String email;
  String genero;
  String dddCelular;
  String dddTelefone;
  String cep;
  String endereco;
  String estado;
  String cidade;
  String userId;

  Meusdados();

  Meusdados.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;

    this.nome = documento.data["nome"];
    this.cpf = documento.data["cpf"];
    this.email = documento.data["email"];
    this.genero = documento.data["genero"];
    this.dddCelular = documento.data["dddCelular"];
    this.dddTelefone = documento.data["dddTelefone"];
    this.cep = documento.data["cep"];
    this.endereco = documento.data["endereco"];
    this.estado = documento.data["estado"];
    this.cidade = documento.data["cidade"];
    this.userId = documento.data["user_id"];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['nome'] = this.nome;
    map['cpf'] = this.cpf;
    map['email'] = this.email;
    map['genero'] = this.genero;
    map['dddCelular'] = this.dddCelular;
    map['dddTelefone'] = this.dddTelefone;
    map['cep'] = this.cep;
    map['endereco'] = this.endereco;
    map['estado'] = this.estado;
    map['cidade'] = this.cidade;
    map['user_id'] = this.userId;

    return map;
  }

  @override
  String documentId() => _documentId;
}
=======
import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class Meusdados extends ModeloBase {
  String _documentId;
  String nome;
  String cpf;
  String email;
  String genero;
  String dddCelular;
  String dddTelefone;
  String cep;
  String endereco;
  String estado;
  String cidade;
  String userId;

  Meusdados();

  Meusdados.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;

    this.nome = documento.data["nome"];
    this.cpf = documento.data["cpf"];
    this.email = documento.data["email"];
    this.genero = documento.data["genero"];
    this.dddCelular = documento.data["dddCelular"];
    this.dddTelefone = documento.data["dddTelefone"];
    this.cep = documento.data["cep"];
    this.endereco = documento.data["endereco"];
    this.estado = documento.data["estado"];
    this.cidade = documento.data["cidade"];
    this.userId = documento.data["user_id"];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['nome'] = this.nome;
    map['cpf'] = this.cpf;
    map['email'] = this.email;
    map['genero'] = this.genero;
    map['dddCelular'] = this.dddCelular;
    map['dddTelefone'] = this.dddTelefone;
    map['cep'] = this.cep;
    map['endereco'] = this.endereco;
    map['estado'] = this.estado;
    map['cidade'] = this.cidade;
    map['user_id'] = this.userId;

    return map;
  }

  @override
  String documentId() => _documentId;
}
>>>>>>> d1f0c6d65c3c11830a19ae8dc3e6aa856dc029fb
