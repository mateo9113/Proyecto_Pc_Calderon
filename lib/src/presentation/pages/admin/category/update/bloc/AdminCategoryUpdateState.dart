import 'dart:io';

import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Category.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdminCategoryUpdateState extends Equatable {
  final int id;
  final BlocFormItem nombre;
  final BlocFormItem descripcion;
  final GlobalKey<FormState>? formKey;
  File? file;
  final Resource? response;

  AdminCategoryUpdateState(
      {this.id = 0,
      this.nombre = const BlocFormItem(error: 'Ingresa el nombre'),
      this.descripcion = const BlocFormItem(error: 'Ingresa la descripcion'),
      this.formKey,
      this.response,
      this.file});

  toCategory() => Category(
        id: id,
        nombre: nombre.value,
        descripcion: descripcion.value,
      );

  AdminCategoryUpdateState resetForm() {
    return AdminCategoryUpdateState(file: null);
  }

  AdminCategoryUpdateState copyWith(
      {int? id,
      BlocFormItem? nombre,
      BlocFormItem? descripcion,
      GlobalKey<FormState>? formKey,
      File? file,
      Resource? response}) {
    return AdminCategoryUpdateState(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        file: file ?? this.file,
        formKey: formKey,
        response: response);
  }

  @override
  List<Object?> get props => [id, nombre, descripcion, file, response];
}
