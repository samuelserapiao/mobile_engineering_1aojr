import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_engineering_1aojr/home/home.dart';

import 'cars/list_car.dart';

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
      initialRoute: '/listCars',
      routes: {
        '/': (context) => const Home(),
        '/listCars': (context) => const ListCars()
      },
    );
  }
}

