import 'package:flutter/material.dart';
import 'package:phrasis_frontend/widget/custom_text_field.dart';

const String labelText = 'Nombre';
const String errorNull = 'Debes llenar el campo';
const String errorLetter = 'Solo se permiten letras';
const String errorLenght = 'Debe tener maximo 16 caracteres';
const int maxNameLenght = 16;

const String pattern = r"[A-Za-zÀ-ÿ]*";
final regExp = RegExp(pattern);

class NameField extends StatefulWidget {
  const NameField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<NameField> createState() => _NameField();
}

class _NameField extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      prefixIcon: const Icon(Icons.person_rounded),
      labelText: labelText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorNull;
        } else if (!regExp.hasMatch(value)) {
          return errorLetter;
        } else if (value.length > maxNameLenght) {
          return errorLenght;
        }
        return null;
      },
      controller: widget.controller,
    );
  }
}