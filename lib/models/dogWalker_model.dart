import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class DogWalker extends ModeloBase {
  String _documentId;
  String petId;
  DateTime dataEHorarioInicioPasseio;
  DateTime dataEHorarioFimPasseio;
  bool vacinacaoEmDia;
  bool possuiAlgumaRestricao;
  String informeARestricao;
  bool telebusca;
  String observacao;
  String empresaId;
  String informeLocalTelebusca;

  DogWalker();

  DogWalker.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;
    this.petId = documento.data["petId"];
    //this.VacinacaoEmDia = documento.data["vacinacaoEmDia"];
    //this.PossuiAlgumaRestricao = documento.data["possuiAlgumaRestricao"];
   // this.InformeARestricao = documento.data["informeARestricao"];
   // this.Telebusca = documento.data["telebusca"];
    this.observacao = documento.data["observacao"];
    this.empresaId = documento.data["empresaId"];
    this.informeLocalTelebusca = documento.data["informeLocalTelebusca"];

        Timestamp ts = documento.data["dataEHorarioInicioPasseio"];

    this.dataEHorarioInicioPasseio =
        DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch);

    Timestamp tss = documento.data["dataEHorarioFimPasseio"];

    this.dataEHorarioFimPasseio =
        DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch);
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['petId'] = this.petId;
    map['dataEHorarioInicioPasseio'] = this.dataEHorarioInicioPasseio;
    map['informeLocalTelebusca'] = this.informeLocalTelebusca;
    map['dataEHorarioFimPasseio'] = this.dataEHorarioFimPasseio;
    map['vacinacaoEmDia'] = this.vacinacaoEmDia;
    map['possuiAlgumaRestricao'] = this.possuiAlgumaRestricao;
    map['informeARestricao'] = this.informeARestricao;
    map['telebusca'] = this.telebusca;
    map['observacao'] = this.observacao;
    map['empresaId'] = this.empresaId;

    return map;
  }

  @override
  String documentId() => _documentId;
}
