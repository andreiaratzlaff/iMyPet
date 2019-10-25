import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PetRepository extends Disposable {

CollectionReference _collection= Firestore.instance.collection("pet");

void add()
  //dispose will be called automatically by closing its streams
  @override
  void dispose() {}
}
