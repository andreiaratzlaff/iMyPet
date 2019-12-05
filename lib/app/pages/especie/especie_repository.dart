import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:iMyPet/models/especie_model.dart';
import 'package:rxdart/rxdart.dart';

class EspecieRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('petTipo');

  void add(Especie especie) => _collection.add(especie.toMap());

  void update(String documentId, Especie especie) =>
      _collection.document(documentId).updateData(especie.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<Especie>> get especie =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<Especie>((document) => Especie.fromMap(document))
          .toList()));

  Observable<Especie> especieId( String _id) => 
     Observable(_collection.where('documentID', isEqualTo: _id)
     .snapshots().map((query) => query.documents.map<Especie>((document)
     => Especie.fromMap(document)).first));

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
