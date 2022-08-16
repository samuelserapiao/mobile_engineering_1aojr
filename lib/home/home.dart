import 'package:flutter/material.dart';
import 'package:mobile_engineering_1aojr/home/schedule_car.dart';
import 'package:mobile_engineering_1aojr/home/status_car.dart';
import '../menus/list_car.dart';
import '../util/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String _title = 'Agenda do Carro';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorBackground,
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ListCar(),
              StatusCar(),
              // ScheduleCar()
            ],
          ),
        )
      ),
    );
  }
}
