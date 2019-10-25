import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:imypet/models/pet_model.dart';
import 'package:rxdart/rxdart.dart';

class PetRepository extends Disposable {

CollectionReference _collection= Firestore.instance.collection("pet");

void add(Pet pet){
_collection.add(pet.toMap());

}

void update(String _documentId, Pet pet){
_collection.document(_documentId).updateData(pet.toMap());

}

void delete(String _documentId){
  _collection.document(_documentId).delete();
}

Observable<List<Pet>> get pet =>
Observable(_collection.snapshots().map((query)=>
query.documents.map<Pet>((document)=>
Pet.fromMap(document)).toList())); //Observable

Future fetchPost(Dio client) async{
final response =
await client.get('https:jsonplaceholder.typicode.com/post/1');
return response.data;
}
  //dispose will be called automatically by closing its streams
  @override
  void dispose() {}
}

