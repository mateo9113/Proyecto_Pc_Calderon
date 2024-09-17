import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  String text;
  Function() onPressed;
  Color color;

  DefaultButton({required this.text, required this.onPressed, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      // margin: EdgeInsets.only(
      //     left: 25, right: 20, top: 24, bottom: 17), //separcion de botones
      child: ElevatedButton(
        //boton
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
