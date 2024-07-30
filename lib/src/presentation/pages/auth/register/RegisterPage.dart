import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultButton.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultIconBack.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Colors.black, // o double.infinity
        child: Stack(
          alignment: Alignment.center,
          children: [
            //agregar fondo
            Image.asset(
              'assets/img/fondo.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover, //para que ocupe todo el espacio
              color: Colors.black54, //opacidad de la imaagen
              colorBlendMode: BlendMode.darken, //img ahumada
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                //para decorar todo el contenedor
                color: Color.fromRGBO(0, 0, 0, 0.86),
                borderRadius: BorderRadius.all(Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    //agregar unaluz de fondo sombreada
                    color: Color.fromARGB(255, 78, 71, 27).withOpacity(0.7),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                //refactor-> windget y ponerlo singlechildscrollview para solucionar error de botonesal querer escribir
                child: Column(
                  children: [
                    Image.asset(
                      'assets/img/logo.png',
                      height: 100.0,
                      width: 100.0,
                    ),
                    Text(
                      'REGISTRO',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold //negrita
                          ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        //
                        label: 'Nombre',
                        icon: Icons.person,
                        onChanged: (text) {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        //
                        label: 'Apellido',
                        icon: Icons.person,
                        onChanged: (text) {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        //
                        label: 'Email',
                        icon: Icons.email,
                        onChanged: (text) {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        //
                        label: 'Telefono',
                        icon: Icons.phone,
                        onChanged: (text) {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        //
                        label: 'Contraseña',
                        icon: Icons.lock,
                        onChanged: (text) {},
                        obscureText: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        //
                        label: 'Confirmar Contraseña',
                        icon: Icons.lock_outline,
                        onChanged: (text) {},
                        obscureText: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 20, top: 24, bottom: 17),
                      child: DefaultButton(
                        //
                        text: 'REGISTRARSE',
                        onPressed: () {},
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            ),
            DefaultIconback(
              left: 45,
              top: 165,
            ),
          ],
        ),
      ),
    );
  }
}
