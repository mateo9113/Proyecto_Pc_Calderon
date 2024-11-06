import 'dart:io';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdminProductCreateState extends Equatable {
  final int idCategory;
  final BlocFormItem nombre;
  final BlocFormItem descripcion;
  final BlocFormItem precio;
  final GlobalKey<FormState>? formKey;
  final BlocFormItem stock;
  File? file1;
  File? file2;
  final Resource? response;

  AdminProductCreateState(
      {this.nombre = const BlocFormItem(error: 'Ingresa el nombre'),
      this.descripcion = const BlocFormItem(error: 'Ingresa la descripcion'),
      this.precio = const BlocFormItem(error: 'Ingresa el precio'),
      this.idCategory = 0,
      this.stock = const BlocFormItem(error: 'Ingresa la Cantidad'),
      this.formKey,
      this.response,
      this.file1,
      this.file2});

  toProduct() => Product(
        nombre: nombre.value,
        descripcion: descripcion.value,
        precio: double.parse(precio.value),
        stock: int.parse(stock.value),
        id_categoria: idCategory,
      );

  AdminProductCreateState resetForm() {
    return AdminProductCreateState(
      nombre: const BlocFormItem(error: 'Ingresa el nombre'),
      descripcion: const BlocFormItem(error: 'Ingresa la descripcion'),
    );
  }

  AdminProductCreateState copyWith(
      {int? idCategory,
      BlocFormItem? nombre,
      BlocFormItem? descripcion,
      BlocFormItem? precio,
      GlobalKey<FormState>? formKey,
      File? file1,
      File? file2,
      BlocFormItem? stock,
      Resource? response}) {
    return AdminProductCreateState(
        idCategory: idCategory ?? this.idCategory,
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        precio: precio ?? this.precio,
        file1: file1 ?? this.file1,
        file2: file2 ?? this.file2,
        stock: stock ?? this.stock,
        formKey: formKey,
        response: response);
  }

  @override
  List<Object?> get props => [idCategory, nombre, descripcion, precio, file1, file2, stock, response];
}
