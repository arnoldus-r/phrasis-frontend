import 'package:flutter/material.dart';
import 'package:phrasis_frontend/widget/custom_text_field.dart';

const int passwordMinLenght = 8;
const String labelText = 'Contraseña';
const String errorNull = 'Debes llenar el campo';
const String errorLenght = 'Debe tener minimo 8 caracteres';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<PasswordField> createState() => _PasswordField();
}

class _PasswordField extends State<PasswordField> {
  bool passwordHidden = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      obscureText: passwordHidden,
      prefixIcon: const Icon(Icons.lock),
      suffixIcon: IconButton(
        icon: Icon(passwordHidden ? Icons.visibility : Icons.visibility_off),
        	onPressed: () {
          	setState(
            	() {
              	passwordHidden = !passwordHidden;
            },
          );
        },
      ),
      	labelText: labelText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorNull;
        } else if (value.length < passwordMinLenght) {
          return errorLenght;
        }
        return null;
      },
      controller: widget.controller,
    );
  }
}
