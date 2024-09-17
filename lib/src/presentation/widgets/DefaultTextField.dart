import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultTextField extends StatelessWidget {
  String label;
  String? errorText;
  IconData icon;
  Function(String text) onChanged;
  String? Function(String?)? validator;
  bool obscureText;

  DefaultTextField({
    //
    super.key,
    required this.label,
    this.errorText,
    this.validator,
    required this.icon,
    required this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: (text) {
        onChanged(text);
      },
      validator: validator,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
              //estilo
              color: Colors.white),
        ),
        errorText: errorText,
        prefixIcon: Icon(
          //o sufixIcon para que cambie de lado
          icon,
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: TextStyle(
        color: Colors.white, //color de la letra ingresada
      ),
    );
  }
}
