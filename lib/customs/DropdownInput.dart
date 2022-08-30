// import 'package:flutter/material.dart';
//
// class DropdownInput<T> extends StatelessWidget {
//   final String hintText;
//   final String label;
//   final Icon icon;
//   final List<T> options;
//   final T value;
//   final String Function(T) getLabel;
//   final void Function(T) onChanged;
//
//   const DropdownInput(
//       {this.hintText = 'Selecione uma opção',
//       this.options = const [],
//       required this.getLabel,
//       required this.value,
//       required this.onChanged,
//       required this.label,
//       required this.icon});
//
//   @override
//   Widget build(BuildContext context) {
//     return FormField(builder: (FormFieldState<T> state) {
//       return InputDecorator(
//         decoration: InputDecoration(
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
//           labelText: hintText,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
//         ),
//         isEmpty: value == null || value == '',
//         child: DropdownButtonFormField<T>(
//           isExpanded: true,
//           icon: icon,
//           hint: Text(hintText),
//           decoration: InputDecoration(
//               label: Text(label),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(6))),
//           value: value,
//           onChanged: onChanged,
//           items: options
//               .map((T op) => DropdownMenuItem(value: op, child: Text(getLabel(op))))
//               .toList(),
//         ),
//       );
//     });
//   }
// }
