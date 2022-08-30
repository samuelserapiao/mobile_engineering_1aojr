import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../list_car.dart';

class SelectedCar extends StatefulWidget {
  const SelectedCar({Key? key}) : super(key: key);

  @override
  State<SelectedCar> createState() => _SelectedCarState();
}

class _SelectedCarState extends State<SelectedCar> {

  String carKey = '0';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ListCars()));
      },
      child: Container(
        margin: const EdgeInsets.all(1.0),
        padding: const EdgeInsets.all(1.0),
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(6)),
        child: _buildCar(context),
      ),
    );
  }
}

Widget _buildCar(BuildContext context) {
  CollectionReference cars = FirebaseFirestore.instance.collection('car')
  ;

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
        return Text("\n${data['brand']} ${data['model']}");
      }

      return const Text("loading");
    },
  );
}

Future<String> _getSelectedCar() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('carKey') ?? '0';
}