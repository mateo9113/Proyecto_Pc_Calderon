import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultDropdownButtonFormField extends StatelessWidget {
  String label;
  IconData icon;
  List<DropdownMenuItem<String>> items;
  Function(String value) onChanged;

  DefaultDropdownButtonFormField({
    required this.label,
    required this.icon,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      onChanged: (String? newValue) {
        if (newValue != null) {
          onChanged(newValue); // Llama a onChanged solo si newValue no es nulo
        }
      },
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white, // Estilo del texto del label
          ),
        ),
        prefixIcon: Icon(
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
      dropdownColor: Colors.black, // Cambia el color del dropdown
      items: items,
      style: TextStyle(
        color: Colors.white, // Color del texto del dropdown
      ),
    );
  }
}
