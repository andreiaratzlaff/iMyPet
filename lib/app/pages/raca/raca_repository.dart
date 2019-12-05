import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:iMyPet/models/raca_model.dart';
import 'package:rxdart/rxdart.dart';

class RacaRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('tipoRaca');

  void add(Raca raca) => _collection.add(raca.toMap());

  void update(String documentId, Raca raca) =>
      _collection.document(documentId).updateData(raca.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<Raca>> get raca =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<Raca>((document) => Raca.fromMap(document))
          .toList()));

  Observable<Raca> racaId( String _id) => 
     Observable(_collection.where('documentID', isEqualTo: _id)
     .snapshots().map((query) => query.documents.map<Raca>((document)
     => Raca.fromMap(document)).first));

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
