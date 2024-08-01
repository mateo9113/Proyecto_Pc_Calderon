import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultTexfield extends StatelessWidget {
  String label;
  IconData icon;
  Function(String text) onChanged;

  DefaultTexfield({
    //
    required this.label,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    );
  }
}
