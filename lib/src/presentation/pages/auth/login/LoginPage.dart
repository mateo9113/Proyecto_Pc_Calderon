import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/AuthResponse.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginState.dart';
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
  LoginBloc? _bloc;

  //llamamos al metodo para iniciar para que se inicie solo o ejecute 1 vez
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   LoginBloc?.dispose(); // para la validacion
    // });
  }

  @override
  Widget build(BuildContext context) {
    // inicado el loginbloc HAY Q IGUAL CONF EN EL MAIN
    _bloc = BlocProvider.of<LoginBloc>(context, listen: false);

    return Scaffold(
      //esqueleto
      body: SizedBox(
        //se le agrega container para agregar colory espacio
        width: double.infinity, // para indicar el espacio que quiero ocupar
        // color: Colors.amber,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            final responseState = state.response;
            if (responseState is Error) {
              Fluttertoast.showToast(
                msg: responseState.message,
                toastLength: Toast.LENGTH_LONG,
              );
            } else if (responseState is Success) {
              final authResponse = responseState.data as AuthResponse;
              // _bloc?.add(LoginFormReset());
              _bloc?.add(LoginSaveUserSession(authResponse: authResponse));
              // Fluttertoast.showToast(
              //   msg: 'Login Exitoso',
              //   toastLength: Toast.LENGTH_LONG,
              // );
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
              });
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              final responseState = state.response;
              if (responseState is Loading) {
                return Stack(
                  children: [
                    LoginContent(_bloc, state),
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              }
              return LoginContent(_bloc, state);
            },
          ),
        ),
      ),
    );
  }
}
