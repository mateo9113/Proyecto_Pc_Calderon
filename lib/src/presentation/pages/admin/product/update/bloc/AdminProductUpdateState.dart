import 'dart:io';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminProductUpdateState extends Equatable {
  final int id;
  final int idCategoria;
  final BlocFormItem nombre;
  final BlocFormItem descripcion;
  final BlocFormItem precio;
  final GlobalKey<FormState>? formKey;
  File? file1;
  File? file2;
  final Resource? response;

  AdminProductUpdateState({
    this.id = 0,
    this.nombre = const BlocFormItem(error: 'Ingresa el nombre'),
    this.descripcion = const BlocFormItem(error: 'Ingresa la descripcion'),
    this.precio = const BlocFormItem(error: 'Ingresa el precio'),
    this.idCategoria = 0,
    this.formKey,
    this.response,
    this.file1,
    this.file2,
  });

  toProduct() => Product(
      id: id,
      nombre: nombre.value,
      descripcion: descripcion.value,
      precio: double.parse(precio.value),
      id_categoria: idCategoria);

  AdminProductUpdateState resetForm() {
    return AdminProductUpdateState(file1: null, file2: null);
  }

  AdminProductUpdateState copyWith(
      {int? id,
      int? idCategoria,
      BlocFormItem? nombre,
      BlocFormItem? descripcion,
      BlocFormItem? precio,
      GlobalKey<FormState>? formKey,
      File? file1,
      File? file2,
      Resource? response,
      List<int>? imagesToUpdate}) {
    return AdminProductUpdateState(
      id: id ?? this.id,
      idCategoria: idCategoria ?? this.idCategoria,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      precio: precio ?? this.precio,
      file1: file1 ?? this.file1,
      file2: file2 ?? this.file2,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [idCategoria, nombre, descripcion, precio, file1, file2, response];
}
