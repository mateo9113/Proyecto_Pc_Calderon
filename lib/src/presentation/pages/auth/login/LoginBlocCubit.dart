import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/LoginBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

// ignore: file_names// sirve para controlar y hacer Validaciones
class LoginBlocCubit extends Cubit<LoginBlocState> {
  // esto es para controlar los inicios
  LoginBlocCubit() : super(LoginInitial());
// controladores de la insercion de el login

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  //metodos

  void changeEmail(String email) {
    if (email.isNotEmpty && email.length < 6) {
      _emailController.sink
          .addError('La longitud de caracteres tiene que ser mayor a 6');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 6) {
      _passwordController.sink.addError('error de Contraseña');
    } else {
      _passwordController.sink.add(password);
    }
  }

  Stream<bool> get validateFrom => Rx.combineLatest2(
      emailStream, passwordStream, (a, b) => true); //combina los resultados
  //combinar para validar

  // metodo para borrar datos
  void dispose() {
    //cuando pasemos a otra pantalla

    changeEmail('');
    changePassword('');
  }

  void login() {
    print('Email: ${_emailController.value}');
    print('Password: ${_passwordController.value}');
  }
}
