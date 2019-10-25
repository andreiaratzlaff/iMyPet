import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseModel{
BaseModel();

BaseModel.fromMap(DocumentSnapshot documento);
toMap();

String documentId();

}