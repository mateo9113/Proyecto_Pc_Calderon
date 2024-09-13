import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class InitEvent extends LoginEvent {
  const InitEvent();
}

class CorreoChanged extends LoginEvent {
  final BlocFormItem correo;
  const CorreoChanged({required this.correo});
  @override
  List<Object?> get props => [correo];
}

class ContraseniaChanged extends LoginEvent {
  final BlocFormItem contrasenia;
  const ContraseniaChanged({required this.contrasenia});
  @override
  List<Object?> get props => [contrasenia];
}

class LoginSubmit extends LoginEvent {
  const LoginSubmit();
}
