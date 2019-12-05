import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class Raca extends ModeloBase {
  String _documentId;
  String nomeRaca;

  Raca();

  Raca.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;

    this.nomeRaca = documento.data["nomeRaca"];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['nomeRaca'] = this.nomeRaca;

    return map;
  }

  @override
  String documentId() => _documentId;
}
