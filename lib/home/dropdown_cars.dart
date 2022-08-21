import 'package:flutter/material.dart';
import '../util/constants.dart';

class ListCar extends StatefulWidget {
  const ListCar({Key? key}) : super(key: key);

  @override
  State<ListCar> createState() => _ListCarState();
}

class _ListCarState extends State<ListCar> {
  String dropdownValue = 'Hyundai Tucson 2012/2013 Prata';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(1.0),
      alignment: Alignment.topCenter,
      width: 400,
      decoration: BoxDecoration(
        color: colorBackgroundDropDown,
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple, fontSize: 24),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'Hyundai Tucson 2012/2013 Prata',
          'Fiat Palio 2009/2010 Branco',
          '<Cadastrar veículo>'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
