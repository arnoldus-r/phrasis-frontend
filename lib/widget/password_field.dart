import 'package:flutter/material.dart';

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
    return TextFormField(
      obscureText: passwordHidden,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
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
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
        labelText: labelText,
      ),
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


/* rfc2822 email validator
[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?
*/