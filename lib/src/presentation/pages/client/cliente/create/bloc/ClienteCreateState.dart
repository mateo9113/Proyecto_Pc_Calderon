import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ClienteCreateState extends Equatable {
  final BlocFormItem nombre;
  final BlocFormItem tipoDocumento;
  final BlocFormItem numDocumento;
  final BlocFormItem telefono;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  ClienteCreateState({
    this.nombre = const BlocFormItem(error: 'Ingresa el nombre'),
    this.tipoDocumento = const BlocFormItem(error: 'Ingresa el tipo de documento'),
    this.numDocumento = const BlocFormItem(error: 'Ingresa el número de documento'),
    this.telefono = const BlocFormItem(error: 'Ingresa el teléfono'),
    this.formKey,
    this.response,
  });

  // Método para convertir a un objeto Cliente
  Cliente toCliente() => Cliente(
        nombre: nombre.value,
        tipoDocumento: tipoDocumento.value,
        numDocumento: numDocumento.value,
        telefono: telefono.value,
      );

  // Método para resetear el formulario
  ClienteCreateState resetForm() {
    return ClienteCreateState(
      nombre: const BlocFormItem(error: 'Ingresa el nombre'),
      tipoDocumento: const BlocFormItem(error: 'Ingresa el tipo de documento'),
      numDocumento: const BlocFormItem(error: 'Ingresa el número de documento'),
      telefono: const BlocFormItem(error: 'Ingresa el teléfono'),
    );
  }

  ClienteCreateState copyWith({
    BlocFormItem? nombre,
    BlocFormItem? tipoDocumento,
    BlocFormItem? numDocumento,
    BlocFormItem? telefono,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return ClienteCreateState(
      nombre: nombre ?? this.nombre,
      tipoDocumento: tipoDocumento ?? this.tipoDocumento,
      numDocumento: numDocumento ?? this.numDocumento,
      telefono: telefono ?? this.telefono,
      formKey: formKey,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [nombre, tipoDocumento, numDocumento, telefono, response];
}
