import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:iMyPet/models/vacinas_model.dart';
import 'package:rxdart/rxdart.dart';

class VacinasRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('Vacinas');

  void add(Vacinas vacinas) => _collection.add(vacinas.toMap());

  void update(String documentId, Vacinas vacinas) =>
      _collection.document(documentId).updateData(vacinas.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<Vacinas>> get vacinas =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<Vacinas>((document) => Vacinas.fromMap(document))
          .toList()));

  Observable<Vacinas> vacinasId( String _id) => 
     Observable(_collection.where('documentID', isEqualTo: _id)
     .snapshots().map((query) => query.documents.map<Vacinas>((document)
     => Vacinas.fromMap(document)).first));

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
