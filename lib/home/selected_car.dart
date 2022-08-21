import 'package:flutter/material.dart';
import 'package:mobile_engineering_1aojr/cars/list_car.dart';

class SelectedCar extends StatefulWidget {
  const SelectedCar({Key? key}) : super(key: key);

  @override
  State<SelectedCar> createState() => _SelectedCarState();
}

class _SelectedCarState extends State<SelectedCar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ListCars()
          )
        );
      },
      child: Container(
        margin: const EdgeInsets.all(1.0),
        padding: const EdgeInsets.all(1.0),
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
