import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultButton.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultIconBack.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class RegisterContent extends StatelessWidget {
  RegisterBloc? bloc;
  RegisterState state;

  RegisterContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
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
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold //negrita
                        ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Nombre',
                      icon: Icons.person,
                      onChanged: (text) {
                        bloc?.add(RegisterNombreChanged(nombre: BlocFormItem(value: text)));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Apellido',
                      icon: Icons.person,
                      onChanged: (text) {
                        bloc?.add(RegisterApellidoChanged(apellido: BlocFormItem(value: text)));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Email',
                      icon: Icons.email,
                      onChanged: (text) {
                        bloc?.add(RegisterCorreoChanged(correo: BlocFormItem(value: text)));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Telefono',
                      icon: Icons.phone,
                      onChanged: (text) {
                        bloc?.add(RegisterTelefonoChanged(telefono: BlocFormItem(value: text)));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Contraseña',
                      icon: Icons.lock,
                      onChanged: (text) {
                        bloc?.add(RegisterContraseniaChanged(contrasenia: BlocFormItem(value: text)));
                      },
                      obscureText: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Confirmar Contraseña',
                      icon: Icons.lock_outline,
                      onChanged: (text) {
                        bloc?.add(RegisterConfirmaContraseniaChanged(confirmacontrasenia: BlocFormItem(value: text)));
                      },
                      obscureText: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 20, top: 24, bottom: 17),
                    child: DefaultButton(
                      text: 'REGISTRARSE',
                      color: Colors.green,
                      onPressed: () {
                        if (state.formKey!.currentState!.validate()) {
                          bloc?.add(RegisterFormSubmit());
                        } else {
                          Fluttertoast.showToast(
                            msg: "El Formulario no es Valido",
                            toastLength: Toast.LENGTH_LONG,
                          );
                        }
                      },
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
    );
  }
}
