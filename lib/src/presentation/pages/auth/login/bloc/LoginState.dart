import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/AuthResponse.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginState extends Equatable {
  final BlocFormItem correo;
  final BlocFormItem contrasenia;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  const LoginState(
      {this.correo = const BlocFormItem(error: 'Ingrese el correo'),
      this.contrasenia = const BlocFormItem(error: 'Ingrese la Contraseña'),
      this.formKey,
      this.response});

  LoginState copyWith({
    BlocFormItem? correo,
    BlocFormItem? contrasenia,
    Resource? response,
    final GlobalKey<FormState>? formKey,
  }) {
    return LoginState(
      correo: correo ?? this.correo,
      contrasenia: contrasenia ?? this.contrasenia,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [correo, contrasenia, response];
}
