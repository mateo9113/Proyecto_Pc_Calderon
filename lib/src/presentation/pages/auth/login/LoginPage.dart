import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //esqueleto
      body: Container(
        //se le agrega container para agregar colory espacio
        width: double.infinity, // para indicar el espacio que quiero ocupar
        color: Colors.amber,
        child: Stack(
          alignment: Alignment.center, //para q e contenedor este en el centro
          // te habilita el fondo COMO PRIMER ELEMENTO
          children: [
            Image.asset(
              'assets/img/fondo2.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover, //para que ocupe todo el espacio
              color: Colors.black54, //opacidad de la imaagen
              colorBlendMode:
                  BlendMode.darken, //el de arriba y ese lo hace transparente
            ),
            Container(
              //envolvemos todo lo de la columna dentro CONTENEDOR
              //controlar y volver tranasparente
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                  //para decorar todo el contenedor
                  color: Color.fromRGBO(0, 0, 0, 0.86),
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  boxShadow: [
                    BoxShadow(
                      //agregar unaluz de fondo sombreada
                      color: Color.fromARGB(255, 76, 28, 78).withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ]),
              child: Column(
                //contenido
                mainAxisAlignment: MainAxisAlignment
                    .center, //codigo para centrar en una columna
                crossAxisAlignment: CrossAxisAlignment
                    .center, //codigo para central horizonalmente
                children: [
                  Image.asset //logo
                      (
                    'assets/img/logo.png',
                    height: 150.0,
                    width: 150.0,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold), //Estilo y negrilla
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Correo Electronico',
                      icon: Icons.email,
                      onChanged: (text) {
                        print('Text: ${text}');
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Contraseña',
                      icon: Icons.lock,
                      onChanged: (text) {
                        print('Text: ${text}');
                      },
                      obscureText: true,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.only(
                        left: 25,
                        right: 20,
                        top: 24,
                        bottom: 17), //separcion de botones
                    child: ElevatedButton(
                      //boton
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text(
                        'Iniciar Sesion',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
//texto registro
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, //horizontal en row
                    children: [
                      Container(
                        width: 95,
                        height: 1,
                        color: Colors.white,
                        margin: EdgeInsets.only(right: 5), //separacion
                      ),
                      Text(
                        'Deseas Registrarte?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      Container(
                        width: 95,
                        height: 1,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 5), //separacion
                      ),
                    ],
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.only(
                        left: 25, right: 20, top: 24), //separcion de botones
                    child: ElevatedButton(
                      //boton Registrate
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 107, 68, 167)),
                      child: Text(
                        'Registrarse',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
