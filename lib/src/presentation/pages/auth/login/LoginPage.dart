import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/LoginBlocCubit.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/LoginResponse.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultDropdownButtonFormField.dart';
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
    // TODO:implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
            LoginResponse(_loginBlocCubit),
            LoginContent(_loginBlocCubit)
          ],
        ),
      ),
    );
  }
}
