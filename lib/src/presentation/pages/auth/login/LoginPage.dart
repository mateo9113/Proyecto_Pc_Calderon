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
        child: Column(
          //contenido
          mainAxisAlignment:
              MainAxisAlignment.center, //codigo para centrar en una columna
          crossAxisAlignment:
              CrossAxisAlignment.center, //codigo para central horizonalmente
          children: [
            Icon(
              Icons.person,
              color: Colors.black,
              size: 125,
            ),
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold), //Estilo y negrilla
            ),
            TextField(
              decoration: InputDecoration(label: Text('Correo Electronico')),
            ),
            TextField(
              decoration: InputDecoration(label: Text('Contraseña')),
            ),
            ElevatedButton(
              //boton
              onPressed: () {},
              child: Text(
                'Iniciar Sesion',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            Text('Registrarse'),
            ElevatedButton(
              //boton Registrate
              onPressed: () {},
              child: Text(
                'Registrarse',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 107, 68, 167)),
            ),
          ],
        ),
      ),
    );
  }
}
