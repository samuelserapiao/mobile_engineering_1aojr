import 'package:flutter/material.dart';
import 'package:mobile_engineering_1aojr/home/status_car.dart';
import '../util/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: colorBackground,
          appBar: AppBar(
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 1,
                          child: Text("Selecionar veículo"),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text("Cadastrar veículo"),
                        ),
                        const PopupMenuItem(
                          value: 3,
                          child: Text("Sair"),
                        )
                      ])
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                // ListCars(),
                StatusCar(),
                // ScheduleCar()
              ],
            ),
          )),
    );
  }
}
