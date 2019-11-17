import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class Meusdados extends ModeloBase {
  String _documentId;
  String nome;
  String cpf;
  String email;
  String genero;
  String dddCelular;
  String dddtelefone;
  String cep;
  String endereco;
  String estado;

  Meusdados();

  Meusdados.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;

    this.nome = documento.data["nome"];
    this.cpf = documento.data["cpf"];
    this.email = documento.data["email"];
    this.genero = documento.data["genero"];
    this.dddCelular = documento.data["dddCelular"];
    this.dddtelefone = documento.data["dddTelefone"];
    this.cep = documento.data["cep"];
    this.endereco = documento.data["endereco"];
    this.estado = documento.data["estado"];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['nome'] = this.nome;
    map['cpf'] = this.cpf;
    map['email'] = this.email;
    map['genero'] = this.genero;
    map['dddCelular'] = this.dddCelular;
    map['dddtelefone'] = this.dddtelefone;
    map['cep'] = this.cep;
    map['endereco'] = this.endereco;
    map['estado'] = this.estado;

    return map;
  }

  @override
  String documentId() => _documentId;
}
