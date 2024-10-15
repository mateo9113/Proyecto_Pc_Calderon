import 'dart:io';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileUpdateState extends Equatable {
  final int id;
  final BlocFormItem nombre;
  final BlocFormItem apellido;
  final BlocFormItem telefono;
  final File? imagen;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const ProfileUpdateState(
      {this.id = 0,
      this.nombre = const BlocFormItem(error: 'Ingresa el nombre'),
      this.apellido = const BlocFormItem(error: 'Ingresa el apellido'),
      this.telefono = const BlocFormItem(error: 'Ingresa el telefono'),
      this.formKey,
      this.imagen,
      this.response});

  toUser() => Usuario(id: id, nombre: nombre.value, apellido: apellido.value, telefono: telefono.value);

  ProfileUpdateState copyWith(
      {int? id,
      BlocFormItem? nombre,
      BlocFormItem? apellido,
      BlocFormItem? telefono,
      File? imagen,
      GlobalKey<FormState>? formKey,
      Resource? response}) {
    return ProfileUpdateState(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        telefono: telefono ?? this.telefono,
        imagen: imagen ?? this.imagen,
        formKey: formKey,
        response: response);
    // return ProfileUpdateState(
    //   id: id ?? this.id,
    //   nombre: name ?? this.nombre,
    //   apellido: lastname ?? this.apellido,
    //   telefono: phone ?? this.telefono,
    //   imagen: image ?? this.imagen,
    //   formKey: formKey,
    //   response: response
    // );
  }

  @override
  List<Object?> get props => [nombre, apellido, telefono, imagen, response];
  // List<Object?> get props => [id, nombre, apellido, telefono, , response];
}
