import 'package:flutter/material.dart';

import '../customs/buildAppBar.dart';
import '../customs/buildTextField.dart';
import '../home/selected_car.dart';
import '../util/constants.dart';

class Maintenance extends StatefulWidget {
  const Maintenance({Key? key}) : super(key: key);

  @override
  State<Maintenance> createState() => _MaintenanceState();
}

class _MaintenanceState extends State<Maintenance> {
  DateTime selectedDate = DateTime.now();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _mileageController = TextEditingController();
  final TextEditingController _serviceController = TextEditingController();
  final TextEditingController _productsController = TextEditingController();

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
                      key: _formKey,
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
                    label: 'Serviço',
                    controller: _serviceController,
                    textValidator: 'Insira o serviço realizado'),
                BuildTextField(
                    label: 'Produtos',
                    controller: _productsController,
                    textValidator: 'Insira os produtos'),
                BuildTextField(
                    label: 'Quilometragem',
                    controller: _mileageController,
                    textValidator: 'Informe a quilometragem'),
              ],
            ),
          ),
        ));
  }
}
