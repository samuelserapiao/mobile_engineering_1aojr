import 'package:flutter/material.dart';

class ScheduleCar extends StatefulWidget {
  const ScheduleCar({Key? key}) : super(key: key);

  @override
  State<ScheduleCar> createState() => _ScheduleCarState();
}

class _ScheduleCarState extends State<ScheduleCar> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      heightFactor: 0.5,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(1.0),
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          color: Colors.amber,
        ),
      ),
    );
  }
}
