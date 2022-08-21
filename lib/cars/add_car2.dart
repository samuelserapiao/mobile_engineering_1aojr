import 'package:flutter/material.dart';

import '../fields/buildTextField.dart';
import 'model/car.dart';

class AddCar extends StatefulWidget {
  const AddCar({Key? key}) : super(key: key);

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final _formKey = GlobalKey<FormState>();
  final _modelKey = GlobalKey<FormFieldState>();

  final brands = ['Hyundai', 'Kia'];
  final brandsModels = [
    {
      'brand': 'Hyundai',
      'models': [
        'Tucson',
        'Creta',
      ]
    },
    {
      'brand': 'Kia',
      'models': [
        'Sportage',
        'Sorento',
      ]
    }
  ];
  final modelsHyundai = [
    'Tucson',
    'Creta',
  ];
  final modelsKia = [
    'Sportage',
    'Sorento',
  ];

  List<String> listModels = [];

  final models2 = [
    'Tucson',
    'Creta',
    'Sportage',
    'Sorento',
    'City',
    'Civic',
    'Corolla',
    'Cross'
  ];

  final TextEditingController _aliasController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _makeYearController = TextEditingController();
  final TextEditingController _modelYearController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _mileageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Carro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BuildTextField(
                  label: 'Apelido',
                  controller: _aliasController,
                  textValidator: 'Insira um apelido para o carro'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  icon: const Icon(Icons.drive_eta),
                  hint: const Text('Escolha a marca'),
                  decoration: InputDecoration(
                      label: const Text('Marca'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6))),
                  onChanged: (option) {
                    _brandController.text = option.toString();
                    _modelKey.currentState?.reset();
                    setState(() {
                      listModels = [];
                      if (option.toString() == 'Hyundai')
                        listModels = modelsHyundai;
                      if (option.toString() == 'Kia') listModels = modelsKia;
                    });
                  },
                  items: brands
                      .map((op) => DropdownMenuItem(value: op, child: Text(op)))
                      .toList(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: DropdownButtonFormField<String>(
                  key: _modelKey,
                  isExpanded: true,
                  icon: const Icon(Icons.drive_eta),
                  hint: const Text('Escolha o modelo'),
                  decoration: InputDecoration(
                      label: const Text('Modelo'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6))),
                  onChanged: (option) =>
                      _modelController.text = option.toString(),
                  items: listModels
                      .map((op) => DropdownMenuItem(value: op, child: Text(op)))
                      .toList(),
                ),
              ),
              BuildTextField(
                  label: 'Ano de fabricação',
                  controller: _makeYearController,
                  textValidator: 'Insira o ano de fabricação do carro'),
              BuildTextField(
                  label: 'Ano do modelo',
                  controller: _modelYearController,
                  textValidator: 'Insira o ano do modelo do carro'),
              BuildTextField(
                  label: 'Cor do carro',
                  controller: _colorController,
                  textValidator: 'Escolha a cor do carro'),
              BuildTextField(
                  label: 'Quilometragem',
                  controller: _mileageController,
                  textValidator: 'Informe a quilometragem'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                    onPressed: () {
                      //null safety
                      if (_formKey.currentState!.validate()) {
                        Car car = Car(
                            _aliasController.text,
                            _brandController.text,
                            _modelController.text,
                            _makeYearController.text,
                            _modelYearController.text,
                            _colorController.text,
                            _mileageController.text);
                        Navigator.pop(context, car);
                      }
                    },
                    child: const Text('Gravar')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
