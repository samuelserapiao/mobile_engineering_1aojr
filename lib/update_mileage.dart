import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_engineering_1aojr/selected_car.dart';

import 'customs/buildAppBar.dart';
import 'customs/buildTextField.dart';
import 'home.dart';
import 'util/constants.dart';

class UpdateMileage extends StatefulWidget {
  const UpdateMileage({Key? key}) : super(key: key);

  @override
  State<UpdateMileage> createState() => _UpdateMileageState();
}

class _UpdateMileageState extends State<UpdateMileage> {
  DateTime selectedDate = DateTime.now();

  final _formMileageKey = GlobalKey<FormState>();
  final Timestamp _updateAt = Timestamp.now();
  final TextEditingController _mileageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBackground,
        appBar: const BuildAppBar(title: 'Atualizar quilometragem'),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SelectedCar(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                      key: _formMileageKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InputDatePickerFormField(
                            firstDate: DateTime(1980),
                            lastDate: DateTime.now(),
                            initialDate: selectedDate,
                            onDateSubmitted: (date) {
                              setState(() {
                                selectedDate = date;
                              });
                            },
                          )
                        ],
                      )),
                ),
                BuildTextField(
                    label: 'Quilometragem',
                    controller: _mileageController,
                    textValidator: 'Informe a quilometragem'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                      onPressed: () {
                        //null safety
                        if (_formMileageKey.currentState!.validate()) {
                          _updateMileage('sQXlQXuVSUGihg2vFHwS',
                              _mileageController.text, _updateAt);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        }
                      },
                      child: const Text('Gravar')),
                ),
              ],
            ),
          ),
        ));
  }
}

Future<void> _updateMileage(String id, mileage, updateAt) async {
  FirebaseFirestore.instance
      .collection('car')
      .doc(id)
      .update({'mileage': mileage, 'updateAt': updateAt});
}
