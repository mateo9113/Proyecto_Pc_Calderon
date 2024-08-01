import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/LoginBlocCubit.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

// aqui se cambia de StatelessWidget a StatefulWidget que es para poder realizar
//cambios de stado con el flutterbloc  y no con el set State o ctrl+s
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBlocCubit? _loginBlocCubit;

  //llamamos al metodo para iniciar para que se inicie solo o ejecute 1 vez
  @override
  void initState() {
    //ejecuta 1 sola vez cuando carga la pantalla
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _loginBlocCubit?.dispose(); // para la validacion
    });
  }

  @override
  Widget build(BuildContext context) {
    // inicado el loginbloc HAY Q IGUAL CONF EN EL MAIN
    _loginBlocCubit = BlocProvider.of<LoginBlocCubit>(context, listen: false);

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
                ],
              ),
              child: SingleChildScrollView(
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
                      child: StreamBuilder(
                          //para poder trabajar con el bloc y rx
                          stream: _loginBlocCubit?.emailStream,
                          builder: (context, snapshot) {
                            return DefaultTextField(
                              label: 'Correo Electronico',
                              icon: Icons.email,
                              onChanged: (text) {
                                _loginBlocCubit?.changeEmail(text);
                              },
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                          stream: _loginBlocCubit?.passwordStream,
                          builder: (context, snapshot) {
                            return DefaultTextField(
                              label: 'Contraseña',
                              icon: Icons.lock,
                              onChanged: (text) {
                                _loginBlocCubit?.changePassword(text);
                              },
                              obscureText: true,
                            );
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: EdgeInsets.only(
                          left: 25,
                          right: 20,
                          top: 24,
                          bottom: 17), //separcion de botones
                      child: StreamBuilder(
                          stream: _loginBlocCubit?.validateFrom,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              //boton
                              onPressed: () {
                                if (snapshot.hasData) {
                                  _loginBlocCubit
                                      ?.login(); //para q lea la entrada
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "El Formulario no es Valido",
                                    toastLength: Toast.LENGTH_LONG,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  //CONTROL DE BOTON COLOR
                                  backgroundColor: snapshot.hasData
                                      ? Color.fromARGB(255, 224, 156, 9)
                                      : Colors.green),
                              child: Text(
                                'Iniciar Sesion',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }),
                    ),
                    //texto registro
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, //horizontal en row
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
                      margin: EdgeInsets.only(
                          left: 25, right: 20, top: 24), //separcion de botones
                      child: ElevatedButton(
                        //boton Registrate
                        onPressed: () {
                          Navigator.pushNamed(context,
                              'register'); //agregar la ruta del boton en el main defines register
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 107, 68, 167)),
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
      ),
    );
  }
}
