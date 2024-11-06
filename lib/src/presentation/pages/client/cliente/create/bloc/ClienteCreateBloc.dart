import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/create/bloc/ClienteCreateEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/create/bloc/ClienteCreateState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/ClientesUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';

class ClienteCreateBloc extends Bloc<ClienteCreateEvent, ClienteCreateState> {
  final ClientesUseCases clientesUseCases;

  ClienteCreateBloc(this.clientesUseCases) : super(ClienteCreateState()) {
    on<ClienteCreateInitEvent>(_onInitEvent);
    on<NameChanged>(_onNameChanged);
    on<TipoDocumentoChanged>(_onTipoDocumentoChanged);
    on<NumDocumentoChanged>(_onNumDocumentoChanged);
    on<TelefonoChanged>(_onTelefonoChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(ClienteCreateInitEvent event, Emitter<ClienteCreateState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNameChanged(NameChanged event, Emitter<ClienteCreateState> emit) async {
    emit(state.copyWith(
        nombre:
            BlocFormItem(value: event.nombre.value, error: event.nombre.value.isNotEmpty ? null : 'Ingresa el nombre'),
        formKey: formKey));
  }

  Future<void> _onTipoDocumentoChanged(TipoDocumentoChanged event, Emitter<ClienteCreateState> emit) async {
    emit(state.copyWith(
        tipoDocumento: BlocFormItem(
            value: event.tipoDocumento.value,
            error: event.tipoDocumento.value.isNotEmpty ? null : 'Ingresa el tipo de documento'),
        formKey: formKey));
  }

  Future<void> _onNumDocumentoChanged(NumDocumentoChanged event, Emitter<ClienteCreateState> emit) async {
    emit(state.copyWith(
        numDocumento: BlocFormItem(
            value: event.numDocumento.value,
            error: event.numDocumento.value.isNotEmpty ? null : 'Ingresa el número de documento'),
        formKey: formKey));
  }

  Future<void> _onTelefonoChanged(TelefonoChanged event, Emitter<ClienteCreateState> emit) async {
    emit(state.copyWith(
        telefono: BlocFormItem(
            value: event.telefono.value, error: event.telefono.value.isNotEmpty ? null : 'Ingresa el teléfono'),
        formKey: formKey));
  }

  Future<void> _onFormSubmit(FormSubmit event, Emitter<ClienteCreateState> emit) async {
    emit(state.copyWith(
      response: Loading(),
      formKey: formKey,
    ));
    Resource response = await clientesUseCases.create.run(state.toCliente());
    emit(state.copyWith(
      response: response,
      formKey: formKey,
    ));
  }

  Future<void> _onResetForm(ResetForm event, Emitter<ClienteCreateState> emit) async {
    emit(
      state.resetForm(),
    );
  }
}
