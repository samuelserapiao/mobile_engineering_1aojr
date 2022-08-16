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
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(1.0),
      alignment: Alignment.topCenter,
      width: 600,
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
