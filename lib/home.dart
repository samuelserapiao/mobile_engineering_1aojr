import 'package:flutter/material.dart';
import 'package:mobile_engineering_1aojr/scheduleMaintenance.dart';
import 'package:mobile_engineering_1aojr/customs/buildAppBar.dart';
import 'package:mobile_engineering_1aojr/schedule_car.dart';
import 'package:mobile_engineering_1aojr/selected_car.dart';
import 'package:mobile_engineering_1aojr/status_car.dart';
import 'package:mobile_engineering_1aojr/update_mileage.dart';

import 'util/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: colorBackground,
          appBar: const BuildAppBar(title: 'Agenda do carro'),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ListCars(),
                  const SelectedCar(),
                  const StatusCar(),
                  const ScheduleCar(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const UpdateMileage()));
                            },
                            child: const Text('Atualiza quilometragem')),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ScheduleMaintenance()));
                            },
                            child: const Text('Manutenção avulsa')),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
