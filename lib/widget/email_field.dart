import 'package:flutter/material.dart';
import 'package:phrasis_frontend/widget/custom_text_field.dart';

const String labelText = 'Correo electronico';
const String errorNull = 'Debes llenar el campo';
const String errorEmail = 'Correo invalido';

// RFC2822 Email Validation
const String p = r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

class EmailField extends StatefulWidget {
  const EmailField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<EmailField> createState() => _EmailField();
}

class _EmailField extends State<EmailField> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      inputType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.email),
      labelText: labelText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorNull;
        } else if (RegExp(p).hasMatch(value) == false) {
          return errorEmail;
        }
        return null;
      },
      controller: widget.controller,
    );
  }
}

// name \b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+