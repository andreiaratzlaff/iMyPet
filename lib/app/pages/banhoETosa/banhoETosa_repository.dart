import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:iMyPet/models/banhoETosa_model.dart';
import 'package:rxdart/rxdart.dart';

class BanhoETosaRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('banhoETosa');

  void add(BanhoETosa banhoETosa) => _collection.add(banhoETosa.toMap());

  void update(String documentId, BanhoETosa banhoETosa) =>
      _collection.document(documentId).updateData(banhoETosa.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<BanhoETosa>> get banhoETosa =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<BanhoETosa>((document) => BanhoETosa.fromMap(document))
          .toList()));
          
  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
