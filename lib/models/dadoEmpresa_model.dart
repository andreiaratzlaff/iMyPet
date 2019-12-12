
import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class DadoEmpresa extends ModeloBase {
  String _documentId;
  String razaoSocial;
  String nome;
  String paginaFacebookInstagram;
  String email;
  String dddCelular;
  String dddTelefone;
  String cep;
  String endereco;
  String cidade;
  String estado;
  String especialidadeId;


  DadoEmpresa();

 DadoEmpresa.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;
    this.razaoSocial = documento.data["razaoSocial"]; 
    this.nome = documento.data["nome"]; 
    this.paginaFacebookInstagram = documento.data["paginaFacebookInstagram"];
    this.email = documento.data["email"];
    this.dddCelular = documento.data["dddCelular"];
    this.dddTelefone = documento.data["dddTelefone"];
    this.cep = documento.data["cep"];
    this.endereco = documento.data["endereco"];
    this.cidade = documento.data["cidade"];
    this.estado = documento.data["estado"];
    this.especialidadeId = documento.data["especialidadeId"];

   
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['razaoSocial'] = this.razaoSocial;
    map['nome'] = this.nome;
    map['paginaFacebookInstagram'] = this.paginaFacebookInstagram;
    map['email'] = this.email;
    map['dddCelular'] = this.dddCelular;
    map['dddTelefone'] = this.dddTelefone;
    map['cep'] = this.cep;
    map['endereco'] = this.endereco;
    map['cidade'] = this.cidade;
    map['estado'] = this.estado;
    map['estado'] = this.estado;
    map['especialidadeId'] = this.especialidadeId;


    return map;
  }

  @override
  String documentId() => _documentId;
}
