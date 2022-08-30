import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Brand {
  final String name;
  final Array models;

  DocumentReference? reference;

  Brand(this.name, this.models);

  Brand.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map['name'],
        models = map['models'];

  Brand.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
      reference: snapshot.reference);

  Map<String, dynamic> toJson() => {
    'name': name,
    'models': models,
  };
}
