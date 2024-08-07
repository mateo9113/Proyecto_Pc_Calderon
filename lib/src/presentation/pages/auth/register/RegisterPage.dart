import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultButton.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultDropdownButtonFormField.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultIconBack.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBlocCubit? _registerBlocCubit;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _registerBlocCubit?.dispose(); // para la validacion
    });
  }

  @override
  Widget build(BuildContext context) {
    _registerBlocCubit =
        BlocProvider.of<RegisterBlocCubit>(context, listen: false);

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
                    StreamBuilder(
                        stream: _registerBlocCubit?.nameStream,
                        builder: (context, snapshot) {
                          return Container(
                            margin: EdgeInsets.only(left: 25, right: 25),
                            child: DefaultTextField(
                              //
                              label: 'Nombre',
                              // errorText: snapshot.error?.toString(),
                              icon: Icons.person,
                              onChanged: (text) {
                                _registerBlocCubit?.changeName(text);
                              },
                            ),
                          );
                        }),
                    StreamBuilder(
                        stream: _registerBlocCubit?.lastnameStream,
                        builder: (context, snapshot) {
                          return Container(
                            margin: EdgeInsets.only(left: 25, right: 25),
                            child: DefaultTextField(
                              //
                              label: 'Apellido',
                              //errorText: snapshot.error?.toString(),
                              icon: Icons.person,
                              onChanged: (text) {
                                _registerBlocCubit?.changeLastName(text);
                              },
                            ),
                          );
                        }),
                    StreamBuilder(
                        stream: _registerBlocCubit?.emailStream,
                        builder: (context, snapshot) {
                          return Container(
                            margin: EdgeInsets.only(left: 25, right: 25),
                            child: DefaultTextField(
                              //
                              label: 'Email',
                              //errorText: snapshot.error?.toString(),
                              icon: Icons.email,
                              onChanged: (text) {
                                _registerBlocCubit?.changeEmail(text);
                              },
                            ),
                          );
                        }),
                    StreamBuilder(
                        stream: _registerBlocCubit?.phoneStream,
                        builder: (context, snapshot) {
                          return Container(
                            margin: EdgeInsets.only(left: 25, right: 25),
                            child: DefaultTextField(
                              //
                              label: 'Telefono',
                              //errorText: snapshot.error?.toString(),
                              icon: Icons.phone,
                              onChanged: (text) {
                                _registerBlocCubit?.changePhone(text);
                              },
                            ),
                          );
                        }),
                    StreamBuilder(
                        stream: _registerBlocCubit?.passwordStream,
                        builder: (context, snapshot) {
                          return Container(
                            margin: EdgeInsets.only(left: 25, right: 25),
                            child: DefaultTextField(
                              //
                              label: 'Contraseña',
                              //errorText: snapshot.error?.toString(),
                              icon: Icons.lock,
                              onChanged: (text) {
                                _registerBlocCubit?.changePassword(text);
                              },
                              obscureText: true,
                            ),
                          );
                        }),
                    StreamBuilder(
                        stream: _registerBlocCubit?.confirmPasswordStream,
                        builder: (context, snapshot) {
                          return Container(
                            margin: EdgeInsets.only(left: 25, right: 25),
                            child: DefaultTextField(
                              //
                              label: 'Confirmar Contraseña',
                              // errorText: snapshot.error?.toString(),
                              icon: Icons.lock_outline,
                              onChanged: (text) {
                                _registerBlocCubit?.changeConfirmPassword(text);
                              },
                              obscureText: true,
                            ),
                          );
                        }),
                    Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 20, top: 24, bottom: 17),
                      child: StreamBuilder(
                          stream: _registerBlocCubit?.validateForm,
                          builder: (context, snapshot) {
                            return DefaultButton(
                              //
                              text: 'REGISTRARSE',
                              color: Colors.green,
                              onPressed: () {
                                if (snapshot.hasData) {
                                  _registerBlocCubit?.register();
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "El Formulario no es Valido",
                                    toastLength: Toast.LENGTH_LONG,
                                  );
                                }
                              },
                            );
                          }),
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
