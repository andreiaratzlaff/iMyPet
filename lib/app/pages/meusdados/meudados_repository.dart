import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:iMyPet/models/meusdados_model.dart';
import 'package:rxdart/rxdart.dart';

class MeusdadosRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('meusDados');

  void add(Meusdados meusdados) => _collection.add(meusdados.toMap());

  void update(String documentId, Meusdados meusdados) =>
      _collection.document(documentId).updateData(meusdados.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<Meusdados>> get meusdados =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<Meusdados>((document) => Meusdados.fromMap(document))
          .toList()));

  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {
  }
}
