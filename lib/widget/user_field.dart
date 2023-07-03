import 'package:flutter/material.dart';
import 'package:phrasis_frontend/widget/custom_text_field.dart';

const String labelText = 'Usuario';
const String errorNull = 'Debes llenar el campo';
const String errorLetter = 'Usa solo letras, números y puntos';
const String errorLenght = 'Debe tener maximo 16 caracteres';
const int maxNameLenght = 16;

const String pattern = r"[A-Za-z0-9\.]*";
final regExp = RegExp(pattern);

class UserField extends StatefulWidget {
  const UserField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<UserField> createState() => _UserField();
}

class _UserField extends State<UserField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      prefixIcon: const Icon(Icons.account_circle_rounded),
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