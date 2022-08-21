import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String alias;
  final String brand;
  final String model;
  final String makeYear;
  final String modelYear;
  final String color;
  final String mileage;

  DocumentReference? reference;

  Car(this.alias, this.brand, this.model, this.makeYear, this.modelYear,
      this.color, this.mileage);

  Car.fromMap(Map<String, dynamic> map, {this.reference})
      : alias = map['alias'],
        brand = map['brand'],
        model = map['model'],
        makeYear = map['makeYear'],
        modelYear = map['modelYear'],
        color = map['color'],
        mileage = map['mileage'];

  Car.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  Map<String, dynamic> toJson() => {
        'alias': alias,
        'brand': brand,
        'model': model,
        'makeYear': makeYear,
        'modelYear': modelYear,
        'color': color,
        'mileage': mileage,
      };
}
