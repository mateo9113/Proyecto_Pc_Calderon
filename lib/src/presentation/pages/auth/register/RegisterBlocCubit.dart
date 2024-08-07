import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/RegisterBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBlocCubit extends Cubit<RegisterBlocState> {
  RegisterBlocCubit() : super(RegisterInitial()); //si o si tiene q aver v.ini.

  final _nameController = BehaviorSubject<String>();
  final _lastnameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();

  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get lastnameStream => _lastnameController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get phoneStream => _phoneController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream;
//union de los valores :
  Stream<bool> get validateForm => Rx.combineLatest6(
        nameStream,
        lastnameStream,
        emailStream,
        phoneStream,
        passwordStream,
        confirmPasswordStream,
        (a, b, c, d, e, f) => true,
      );
// Validaciones

  void changeName(String name) {
    if (name.isNotEmpty && name.length < 2) {
      _nameController.sink.addError('El nombre es muy corto');
    } else {
      _nameController.sink.add(name);
    }
  }

  void changeLastName(String lastname) {
    if (lastname.isNotEmpty && lastname.length < 2) {
      _lastnameController.sink.addError('El apellido es muy corto');
    } else {
      _lastnameController.sink.add(lastname);
    }
  }

  void changeEmail(String email) {
    bool emailFormatValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (email.isNotEmpty && email.length < 5) {
      _emailController.sink.addError('Al menos 5 caracteres');
    } else if (email.isNotEmpty && !emailFormatValid) {
      _emailController.sink.addError('El email no es valido');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePhone(String phone) {
    if (phone.isNotEmpty && phone.length < 2) {
      _phoneController.sink.addError('El numero esta mal');
    } else {
      _phoneController.sink.add(phone);
    }
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 2) {
      _passwordController.sink.addError('El numero esta mal en formato ');
    } else {
      _passwordController.sink.add(password);
    }
  }

  void changeConfirmPassword(String confirmPassword) {
    if (confirmPassword.isNotEmpty && confirmPassword.length < 2) {
      _confirmPasswordController.sink.addError('El menos 6 caracteres');
    } else if (confirmPassword != _passwordController.value) {
      _confirmPasswordController.sink.addError('Las Contraseñas no coinciden ');
    } else {
      _confirmPasswordController.sink.add(confirmPassword);
    }
  }

  void dispose() {
    //cuando la pantalla se destruye
    changeName('');
    changeLastName('');
    changePhone('');
    changeEmail('');
    changePassword('');
    changeConfirmPassword('');
  }

  //boton de funcion
  void register() {
    print('Nombre: ${_nameController.value}');
    print('Apellido: ${_lastnameController.value}');
    print('Telefono: ${_phoneController.value}');
    print('Correo: ${_emailController.value}');
    print('Contraseña: ${_passwordController.value}');
    print('Confirmacion de Contraseña: ${_confirmPasswordController.value}');
  }
}
