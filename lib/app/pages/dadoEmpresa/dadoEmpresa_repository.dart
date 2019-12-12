import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:iMyPet/models/dadoEmpresa_model.dart';
import 'package:rxdart/rxdart.dart';

class DadoEmpresaRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('dadoEmpresa');

  void add(DadoEmpresa dadoEmpresa) => _collection.add(dadoEmpresa.toMap());

  void update(String documentId, DadoEmpresa dadoEmpresa) =>
      _collection.document(documentId).updateData(dadoEmpresa.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<DadoEmpresa>> get dadoEmpresa =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<DadoEmpresa>((document) => DadoEmpresa.fromMap(document))
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