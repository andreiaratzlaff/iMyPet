import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:iMyPet/models/carteiravacina_model.dart';
import 'package:rxdart/rxdart.dart';

class CarteiraVacinaRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('carteiraVacina');

  void add(CarteiraVacina carteiraVacina) => _collection.add(carteiraVacina.toMap());

  void update(String documentId, CarteiraVacina carteiraVacina) =>
      _collection.document(documentId).updateData(carteiraVacina.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<CarteiraVacina>> get carteiraVacina =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<CarteiraVacina>((document) => CarteiraVacina.fromMap(document))
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
