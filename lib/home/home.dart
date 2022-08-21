import 'package:flutter/material.dart';
import 'package:mobile_engineering_1aojr/cars/maintenance.dart';
import 'package:mobile_engineering_1aojr/cars/update_mileage.dart';
import 'package:mobile_engineering_1aojr/customs/buildAppBar.dart';
import 'package:mobile_engineering_1aojr/home/schedule_car.dart';
import 'package:mobile_engineering_1aojr/home/selected_car.dart';
import 'package:mobile_engineering_1aojr/home/status_car.dart';

import '../util/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6)),
                        child: GestureDetector(onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UpdateMileage()));
                        }),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(6)),
                          child: GestureDetector(onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Maintenance()));
                          }))
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
