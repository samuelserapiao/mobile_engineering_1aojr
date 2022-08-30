import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_engineering_1aojr/selected_car.dart';

import 'customs/buildAppBar.dart';
import 'customs/buildTextField.dart';
import 'util/constants.dart';
import 'cars/model/maintenance.dart';

class ScheduleMaintenance extends StatefulWidget {
  const ScheduleMaintenance({Key? key}) : super(key: key);

  @override
  State<ScheduleMaintenance> createState() => _ScheduleMaintenanceState();
}

class _ScheduleMaintenanceState extends State<ScheduleMaintenance> {
  DateTime selectedDate = DateTime.now();

  final _formScheduleKey = GlobalKey<FormState>();
  final Timestamp _dateController = Timestamp.now();
  final TextEditingController _mileageController = TextEditingController();
  final TextEditingController _serviceController = TextEditingController();
  final TextEditingController _carKeyController = TextEditingController();

  final services = [
    'Troca de oléo',
    'Geometria da suspenção',
    'Higienização do ar-condicionado'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBackground,
        appBar: const BuildAppBar(title: 'Manutenção avulsa'),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SelectedCar(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                      key: _formScheduleKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InputDatePickerFormField(
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2023),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    icon: const Icon(Icons.drive_eta),
                    hint: const Text('Escolha o serviço'),
                    decoration: InputDecoration(
                        label: const Text('Serviço'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6))),
                    onChanged: (option) {
                      _serviceController.text = option.toString();
                    },
                    items: services
                        .map((op) =>
                            DropdownMenuItem(value: op, child: Text(op)))
                        .toList(),
                  ),
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
                        if (_formScheduleKey.currentState!.validate()) {
                          Maintenance maintenance = Maintenance(
                              _serviceController.text,
                              _carKeyController.text,
                              _mileageController.text,
                              _dateController);
                          Navigator.pop(context, maintenance);
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
