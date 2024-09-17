import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterInitEvent extends RegisterEvent {
  const RegisterInitEvent();
}

class RegisterNombreChanged extends RegisterEvent {
  final BlocFormItem nombre;
  const RegisterNombreChanged({required this.nombre});
  @override
  List<Object?> get props => [nombre];
}

class RegisterApellidoChanged extends RegisterEvent {
  final BlocFormItem apellido;
  const RegisterApellidoChanged({required this.apellido});
  @override
  List<Object?> get props => [apellido];
}

class RegisterTelefonoChanged extends RegisterEvent {
  final BlocFormItem telefono;
  const RegisterTelefonoChanged({required this.telefono});
  @override
  List<Object?> get props => [telefono];
}

class RegisterCorreoChanged extends RegisterEvent {
  final BlocFormItem correo;
  const RegisterCorreoChanged({required this.correo});
  @override
  List<Object?> get props => [correo];
}


class RegisterContraseniaChanged extends RegisterEvent {
  final BlocFormItem contrasenia;
  const RegisterContraseniaChanged({required this.contrasenia});
  @override
  List<Object?> get props => [contrasenia];
}

class RegisterConfirmaContraseniaChanged extends RegisterEvent {
  final BlocFormItem confirmacontrasenia;
  const RegisterConfirmaContraseniaChanged({required this.confirmacontrasenia});
  @override
  List<Object?> get props => [confirmacontrasenia];
}

class RegisterFormSubmit extends RegisterEvent {
  const RegisterFormSubmit();
}

class RegisterFormReset extends RegisterEvent {
  const RegisterFormReset();
}
