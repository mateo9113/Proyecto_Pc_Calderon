import 'package:equatable/equatable.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:flutter/material.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';

class ClienteUpdateState extends Equatable {
  final int id;
  final BlocFormItem nombre;
  final BlocFormItem tipoDocumento;
  final BlocFormItem numDocumento;
  final BlocFormItem telefono;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  ClienteUpdateState({
    this.id = 0,
    this.nombre = const BlocFormItem(error: 'Ingresa el nombre'),
    this.tipoDocumento = const BlocFormItem(error: 'Selecciona el tipo de documento'),
    this.numDocumento = const BlocFormItem(error: 'Ingresa el número de documento'),
    this.telefono = const BlocFormItem(error: 'Ingresa el teléfono'),
    this.formKey,
    this.response,
  });

  toCliente() => Cliente(
        id: id,
        nombre: nombre.value,
        tipoDocumento: tipoDocumento.value,
        numDocumento: numDocumento.value,
        telefono: telefono.value,
      );

  ClienteUpdateState resetForm() {
    return ClienteUpdateState(
      id: id,
      formKey: formKey,
    );
  }

  ClienteUpdateState copyWith({
    int? id,
    BlocFormItem? nombre,
    BlocFormItem? tipoDocumento,
    BlocFormItem? numDocumento,
    BlocFormItem? telefono,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return ClienteUpdateState(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      tipoDocumento: tipoDocumento ?? this.tipoDocumento,
      numDocumento: numDocumento ?? this.numDocumento,
      telefono: telefono ?? this.telefono,
      formKey: formKey ?? this.formKey,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [id, nombre, tipoDocumento, numDocumento, telefono, response];
}
