import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'add_car2.dart';
import 'model/car.dart';

class ListCars extends StatefulWidget {
  const ListCars({Key? key}) : super(key: key);

  @override
  State createState() => _ListCarsState();
}

class _ListCarsState extends State<ListCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carros"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Future future = Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCar(),
                  ));
              future.then((car) {
                if (car != null) insertCar(car);
              });
            },
          )
        ],
      ),
      body: _buildBody(context),
    );
  }

  insertCar(Car car) {
    FirebaseFirestore.instance.collection('car').add(car.toJson());
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('car').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const LinearProgressIndicator();
        if (snapshot.data == null) {
          return Container();
        } else {
          return _buildList(context, snapshot.data!.docs);
        }
      },
    );
  }

  Widget _buildList(
      BuildContext context, List<QueryDocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, QueryDocumentSnapshot data) {
    final record = Car.fromSnapshot(data);
    return Padding(
      key: ValueKey(record.model),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.model),
          trailing: Text(record.brand),
          onLongPress: () {
            // data.reference.delete();
          },
        ),
      ),
    );
  }
}
