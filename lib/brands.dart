import 'package:flutter/material.dart';

class Brands extends StatefulWidget {
  const Brands({Key? key}) : super(key: key);

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  final dropValue = ValueNotifier('');
  final dropOpcoes = ['Hyundai', 'Kia', 'Honda', 'Toyota'];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: dropValue,
        builder: (BuildContext context, String value, _) {
          return DropdownButtonFormField<String>(
            isExpanded: true,
            icon: const Icon(Icons.drive_eta),
            hint: const Text('Escolha a marca'),
            decoration: InputDecoration(
              label: const Text('Marca'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6)
              )
            ),
            value: (value.isEmpty) ? null : value,
            onChanged: (option) => dropValue.value = option.toString(),
            items: dropOpcoes
                .map((op) => DropdownMenuItem(value: op, child: Text(op)))
                .toList(),
          );
        });
  }
}
