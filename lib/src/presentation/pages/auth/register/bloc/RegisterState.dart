import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RegisterState extends Equatable {
  final BlocFormItem nombre;
  final BlocFormItem apellido;
  final BlocFormItem correo;
  final BlocFormItem telefono;
  final BlocFormItem contrasenia;
  final BlocFormItem confirmaContrasenia;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const RegisterState({
    this.nombre = const BlocFormItem(error: 'Ingresar el nombre'),
    this.apellido = const BlocFormItem(error: 'Ingresar el apellido'),
    this.correo = const BlocFormItem(error: 'Ingresar el correo'),
    this.telefono = const BlocFormItem(error: 'Ingresar el telefono'),
    this.contrasenia = const BlocFormItem(error: 'Ingresar la Contraseña'),
    this.confirmaContrasenia = const BlocFormItem(error: 'Confirmar La Contraseña'),
    this.formKey,
    this.response,
  });

  toUser() => Usuario(
        nombre: nombre.value,
        apellido: apellido.value,
        correo: correo.value,
        telefono: telefono.value,
        contrasenia: contrasenia.value,
      );

  RegisterState copyWith({
    BlocFormItem? nombre,
    BlocFormItem? apellido,
    BlocFormItem? correo,
    BlocFormItem? telefono,
    BlocFormItem? contrasenia,
    BlocFormItem? confirmaContrasenia,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return RegisterState(
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      correo: correo ?? this.correo,
      telefono: telefono ?? this.telefono,
      contrasenia: contrasenia ?? this.contrasenia,
      confirmaContrasenia: confirmaContrasenia ?? this.confirmaContrasenia,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [nombre, apellido, correo, telefono, contrasenia, confirmaContrasenia, response];
}
