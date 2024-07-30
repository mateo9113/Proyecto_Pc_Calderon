import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultTextField extends StatelessWidget {
  String label;
  IconData icon;
  Function(String text) onChanged;
  bool obscureText;

  DefaultTextField({
    //
    required this.label,
    required this.icon,
    required this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: (text) {
        onChanged(text);
      },
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
              //estilo
              color: Colors.white),
        ),
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
