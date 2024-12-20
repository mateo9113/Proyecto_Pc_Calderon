import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultIconback extends StatelessWidget {
  double left;
  double top;
  Color color;

  DefaultIconback({required this.left, required this.top, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft, //alineacion de el boton
      margin: EdgeInsets.only(left: left, top: top),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 40,
          color: color,
        ),
      ),
    );
  }
}
