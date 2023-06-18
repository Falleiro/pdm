import 'package:flutter/material.dart';

class MyTextForm extends StatefulWidget {
  final TextEditingController myController;
  final String fieldName;
  final String hintText;
  final bool isAddOrRemove;
  const MyTextForm(
      {super.key,
      required this.myController,
      required this.fieldName,
      required this.hintText,
      required this.isAddOrRemove});

  @override
  State<MyTextForm> createState() => _MyTextFormState();
}

class _MyTextFormState extends State<MyTextForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        controller: widget.myController,
        decoration: InputDecoration(
            labelText: widget.fieldName,
            hintText: widget.hintText,
            prefixIcon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            labelStyle: const TextStyle(color: Colors.black)),
        validator: (value) {
          if (widget.isAddOrRemove) {
            if (value != null && int.tryParse(value) == null) {
              return 'Informe um NÚMERO';
            }
          } else {
            if (value != null && value.isEmpty) {
              return 'Informe algo no campo';
            }
          }
          return null;
        },
      ),
    );
  }
}