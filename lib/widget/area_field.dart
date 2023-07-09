import 'package:flutter/material.dart';
import 'package:phrasis_frontend/widget/custom_text_field.dart';

const String labelText = 'Descripción';
const String errorNull = 'Debes llenar el campo';
const String errorLetter = 'Solo se permiten letras';
const String errorLenght = 'Debe tener maximo 127 caracteres';
const int maxNameLenght = 127;

const String pattern = r"[A-Za-zÀ-ÿ]*";
final regExp = RegExp(pattern);

class AreaField extends StatefulWidget {
  const AreaField({super.key, required this.controller, this.lb = 'Descripción'});

  final TextEditingController controller;
  final String lb;

  @override
  State<AreaField> createState() => _AreaField();
}

class _AreaField extends State<AreaField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      inputType: TextInputType.multiline,
      minLines: 3,
      labelText: widget.lb,
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