import 'package:flutter/material.dart';

class ScheduleCar extends StatefulWidget {
  const ScheduleCar({Key? key}) : super(key: key);

  @override
  State<ScheduleCar> createState() => _ScheduleCarState();
}

class _ScheduleCarState extends State<ScheduleCar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1.0),
      padding: const EdgeInsets.all(1.0),
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(6)),
    );
  }
}
