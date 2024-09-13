import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginState extends Equatable {
  final BlocFormItem correo;
  final BlocFormItem contrasenia;
  final GlobalKey<FormState>? formKey;

  const LoginState({
    this.correo = const BlocFormItem(error: 'Ingrese el correo'),
    this.contrasenia = const BlocFormItem(error: 'Ingrese la Contraseña'),
    this.formKey,
  });

  LoginState copyWith({
    BlocFormItem? correo,
    BlocFormItem? contrasenia,
    final GlobalKey<FormState>? formKey,
  }) {
    return LoginState(
      correo: correo ?? this.correo,
      contrasenia: contrasenia ?? this.contrasenia,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [correo, contrasenia];
}
