import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StatusCar extends StatefulWidget {
  const StatusCar({Key? key}) : super(key: key);

  @override
  State<StatusCar> createState() => _StatusCarState();
}

class _StatusCarState extends State<StatusCar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1.0),
      padding: const EdgeInsets.all(1.0),
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(6)),
      child: _buildCar(context),
    );
  }
}

Widget _buildCar(BuildContext context) {
  CollectionReference cars = FirebaseFirestore.instance.collection('car');

  return FutureBuilder<DocumentSnapshot>(
    future: cars.doc('sQXlQXuVSUGihg2vFHwS').get(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Text("Something went wrong");
      }

      if (snapshot.hasData && !snapshot.data!.exists) {
        return const Text("Document does not exist");
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Text(
            "Apelido: ${data['alias']}\nMarca: ${data['brand']}\nModelo: ${data['model']}\nKms: ${data['mileage']}");
      }

      return const Text("loading");
    },
  );
}
