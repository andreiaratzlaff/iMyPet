import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:iMyPet/models/dogWalker_model.dart';
import 'package:rxdart/rxdart.dart';

class DogWalkerRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('dogWalker');

  void add(DogWalker dogWalker) => _collection.add(dogWalker.toMap());

  void update(String documentId, DogWalker dogWalker) =>
      _collection.document(documentId).updateData(dogWalker.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<DogWalker>> get dogWalker =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<DogWalker>((document) => DogWalker.fromMap(document))
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