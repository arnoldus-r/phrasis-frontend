import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool obscureText;
  final TextInputType inputType;
  final int minLines;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final String labelText;
  final Function validator;
  final bool isReadOnly;
  //final Function function;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.minLines = 1,
    this.isReadOnly = false,
    //this.function = () { return null; },
  });

  @override
  State<CustomTextField> createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.isReadOnly,
      //onTap: () => widget.function(),
      obscureText: widget.obscureText,
      keyboardType: widget.inputType,
      minLines: widget.minLines,
      maxLines: widget.minLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
        labelText: widget.labelText,
      ),
      validator: (value) => widget.validator(value),
      controller: widget.controller,
    );
  }
}
