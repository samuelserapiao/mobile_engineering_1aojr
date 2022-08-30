import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_engineering_1aojr/add_car.dart';
import 'package:mobile_engineering_1aojr/home.dart';
import 'package:mobile_engineering_1aojr/login.dart';

import 'list_car.dart';
import 'update_mileage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const Home(),
        '/listCars': (context) => const ListCars(),
        '/addCar': (context) => const AddCar(),
        '/updateMileage': (context) => const UpdateMileage()
      },
    );
  }
}

