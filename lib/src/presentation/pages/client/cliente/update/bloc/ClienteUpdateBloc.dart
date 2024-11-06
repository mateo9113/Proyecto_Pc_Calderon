import 'dart:io';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/ClientesUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/update/bloc/UpdateClienteEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/update/bloc/UpdateClienteState.dart';

import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClienteUpdateBloc extends Bloc<ClienteUpdateEvent, ClienteUpdateState> {
  final ClientesUseCases clientesUseCases;

  ClienteUpdateBloc(this.clientesUseCases) : super(ClienteUpdateState()) {
    on<ClienteUpdateInitEvent>(_onInitEvent);
    on<NameChanged>(_onNameChanged);
    on<TipoDocumentoChanged>(_onTipoDocumentoChanged);
    on<NumDocumentoChanged>(_onNumDocumentoChanged);
    on<TelefonoChanged>(_onTelefonoChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(ClienteUpdateInitEvent event, Emitter<ClienteUpdateState> emit) async {
    emit(state.copyWith(
      id: event.cliente?.id,
      nombre: BlocFormItem(value: event.cliente?.nombre ?? ''),
      tipoDocumento: BlocFormItem(value: event.cliente?.tipoDocumento ?? ''),
      numDocumento: BlocFormItem(value: event.cliente?.numDocumento ?? ''),
      telefono: BlocFormItem(value: event.cliente?.telefono ?? ''),
      formKey: formKey,
    ));
  }

  Future<void> _onNameChanged(NameChanged event, Emitter<ClienteUpdateState> emit) async {
    emit(state.copyWith(
      nombre:
          BlocFormItem(value: event.nombre.value, error: event.nombre.value.isNotEmpty ? null : 'Ingresa el nombre'),
      formKey: formKey,
    ));
  }

  Future<void> _onTipoDocumentoChanged(TipoDocumentoChanged event, Emitter<ClienteUpdateState> emit) async {
    emit(state.copyWith(
      tipoDocumento: BlocFormItem(
          value: event.tipoDocumento.value,
          error: event.tipoDocumento.value.isNotEmpty ? null : 'Selecciona el tipo de documento'),
      formKey: formKey,
    ));
  }

  Future<void> _onNumDocumentoChanged(NumDocumentoChanged event, Emitter<ClienteUpdateState> emit) async {
    emit(state.copyWith(
      numDocumento: BlocFormItem(
          value: event.numDocumento.value,
          error: event.numDocumento.value.isNotEmpty ? null : 'Ingresa el número de documento'),
      formKey: formKey,
    ));
  }

  Future<void> _onTelefonoChanged(TelefonoChanged event, Emitter<ClienteUpdateState> emit) async {
    emit(state.copyWith(
      telefono: BlocFormItem(
          value: event.telefono.value, error: event.telefono.value.isNotEmpty ? null : 'Ingresa el teléfono'),
      formKey: formKey,
    ));
  }

  Future<void> _onFormSubmit(FormSubmit event, Emitter<ClienteUpdateState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    Resource response = await clientesUseCases.update.run(state.id, state.toCliente());
    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onResetForm(ResetForm event, Emitter<ClienteUpdateState> emit) async {
    emit(state.resetForm());
  }
}
