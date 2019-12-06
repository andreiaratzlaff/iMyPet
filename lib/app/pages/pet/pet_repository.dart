import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:iMyPet/models/pet_model.dart';
import 'package:rxdart/rxdart.dart';

class PetRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('pet');

  void add(Pet pet) => _collection.add(pet.toMap());

  void update(String documentId, Pet pet) =>
      _collection.document(documentId).updateData(pet.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<Pet>> get pet =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<Pet>((document) => Pet.fromMap(document))
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