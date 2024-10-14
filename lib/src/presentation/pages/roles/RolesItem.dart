import 'package:app_proyecto_pccalderon/src/domain/models/Role.dart';
import 'package:flutter/material.dart';

class RolesItem extends StatelessWidget {
  Role role;
  RolesItem(this.role);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, role.ruta, (route) => false);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 15),
            height: 100,
            child: FadeInImage(
              image: NetworkImage(role.imagen),
              fit: BoxFit.contain,
              fadeInDuration: Duration(seconds: 1),
              placeholder: AssetImage('assets/img/no-image.png'),
            ),
          ),
          Text(
            role.nombre,
            style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
