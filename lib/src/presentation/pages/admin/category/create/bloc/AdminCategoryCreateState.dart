import 'dart:io';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Category.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminCategoryCreateState extends Equatable {
  final BlocFormItem nombre;
  final BlocFormItem descripcion;
  final GlobalKey<FormState>? formKey;
  File? file;
  final Resource? response;

  AdminCategoryCreateState(
      {this.nombre = const BlocFormItem(error: 'Ingresa el nombre'),
      this.descripcion = const BlocFormItem(error: 'Ingresa la descripcion'),
      this.formKey,
      this.response,
      this.file});

  toCategory() => Category(
        nombre: nombre.value,
        descripcion: descripcion.value,
      );

  AdminCategoryCreateState resetForm() {
    return AdminCategoryCreateState(
      nombre: const BlocFormItem(error: 'Ingresa el nombre'),
      descripcion: const BlocFormItem(error: 'Ingresa la descripcion'),
    );
  }

  AdminCategoryCreateState copyWith(
      {BlocFormItem? nombre,
      BlocFormItem? descripcion,
      GlobalKey<FormState>? formKey,
      File? file,
      Resource? response}) {
    return AdminCategoryCreateState(
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        file: file ?? this.file,
        formKey: formKey,
        response: response);
  }

  @override
  List<Object?> get props => [nombre, descripcion, file, response];
}
