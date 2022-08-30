import 'package:flutter/material.dart';

class BuildTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String textValidator;

  const BuildTextField(
      {Key? key,
      required this.label,
      required this.controller,
      required this.textValidator})
      : super(key: key);

  @override
  State<BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: widget.label,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
        ),
        controller: widget.controller,
        validator: (value) {
          if (value!.isEmpty) {
            return widget.textValidator;
          }
          return null;
        },
      ),
    );
  }
}
