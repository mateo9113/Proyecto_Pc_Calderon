import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginContent extends StatelessWidget {
  LoginBloc? bloc;
  LoginState state;

  LoginContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/img/fondo2.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover, //para que ocupe todo el espacio
            color: Colors.black54, //opacidad de la imaagen
            colorBlendMode: BlendMode.darken, //el de arriba y ese lo hace transparente
          ),
          Container(
            //envolvemos todo lo de la columna dentro CONTENEDOR
            //controlar y volver tranasparente
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              //para decorar todo el contenedor
              color: Colors.black87,
              borderRadius: BorderRadius.all(Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                  //agregar unaluz de fondo sombreada
                  color: Color.fromARGB(255, 76, 28, 78).withOpacity(0.7),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                //contenido
                mainAxisAlignment: MainAxisAlignment.center, //codigo para centrar en una columna
                crossAxisAlignment: CrossAxisAlignment.center, //codigo para central horizonalmente
                children: [
                  Image.asset //logo
                      (
                    'assets/img/logo.png',
                    height: 150.0,
                    width: 150.0,
                  ),
                  Text(
                    'Login',
                    style:
                        TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), //Estilo y negrilla
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Correo Electronico',
                      // errorText: snapshot.error?.toString(),
                      icon: Icons.email,
                      onChanged: (text) {
                        bloc?.add(CorreoChanged(correo: BlocFormItem(value: text)));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Contraseña',
                      // errorText: snapshot.error?.toString(),
                      icon: Icons.lock,
                      onChanged: (text) {
                        bloc?.add(ContraseniaChanged(contrasenia: BlocFormItem(value: text)));
                      },
                      obscureText: true,
                    ),
                    //roles
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: EdgeInsets.only(left: 25, right: 20, top: 24, bottom: 17), //separcion de botones
                      child: ElevatedButton(
                        //boton
                        onPressed: () {
                          bloc?.add(LoginSubmit());
                          // if (snapshot.hasData) {
                          //   bloc?.login(); //para q lea la entrada
                          // } else {
                          //   Fluttertoast.showToast(
                          //     msg: "El Formulario no es Valido",
                          //     toastLength: Toast.LENGTH_LONG,
                          //   );
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          //CONTROL DE BOTON COLOR
                          backgroundColor: Colors.green,
                        ),
                        child: Text(
                          'Iniciar Sesion',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  //texto registro
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, //horizontal en row
                    children: [
                      Container(
                        width: 45,
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
                        width: 45,
                        height: 1,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 5), //separacion
                      ),
                    ],
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.only(left: 25, right: 20, top: 24), //separcion de botones
                    child: ElevatedButton(
                      //boton Registrate
                      onPressed: () {
                        Navigator.pushNamed(
                            context, 'register'); //agregar la ruta del boton en el main defines register
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 107, 68, 167)),
                      child: Text(
                        'Registrate',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
