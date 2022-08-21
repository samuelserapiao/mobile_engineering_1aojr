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
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(6)),
    );
  }
}
