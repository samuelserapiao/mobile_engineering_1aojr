import 'package:cloud_firestore/cloud_firestore.dart';

class Maintenance {
  final String service;
  final String carKey;
  final String mileage;
  final Timestamp date;

  DocumentReference? reference;

  Maintenance(this.mileage, this.service, this.carKey, this.date);

  Maintenance.fromMap(Map<String, dynamic> map, {this.reference})
      : service = map['service'],
        carKey = map['carKey'],
        mileage = map['mileage'],
        date = map['date'];

  Maintenance.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
      reference: snapshot.reference);

  Map<String, dynamic> toJson() => {
    'service': service,
    'carKey': carKey,
    'mileage': mileage,
    'date': date,
  };
}
