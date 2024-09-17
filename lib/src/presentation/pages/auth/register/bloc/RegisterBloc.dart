import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthUseCases authUseCases;

  RegisterBloc(this.authUseCases) : super(RegisterState()) {
    on<RegisterInitEvent>(_onInitEvent);
    on<RegisterNombreChanged>(_onNombreChanged);
    on<RegisterApellidoChanged>(_onApellidoChanged);
    on<RegisterCorreoChanged>(_onCorreoChanged);
    on<RegisterTelefonoChanged>(_onTelefonoChanged);
    on<RegisterContraseniaChanged>(_onContraseniaChanged);
    on<RegisterConfirmaContraseniaChanged>(_onConfirmaContraseniaChanged);
    on<RegisterFormSubmit>(_onFormSubmit);
    on<RegisterFormReset>(_onFormReset);
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(RegisterInitEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNombreChanged(RegisterNombreChanged event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(
        nombre: BlocFormItem(
          value: event.nombre.value,
          error: event.nombre.value.isNotEmpty ? null : 'Ingresa el Nombre ',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onApellidoChanged(RegisterApellidoChanged event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(
        apellido: BlocFormItem(
          value: event.apellido.value,
          error: event.apellido.value.isNotEmpty ? null : 'Ingresa el Apellido ',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onTelefonoChanged(RegisterTelefonoChanged event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(
        telefono: BlocFormItem(
            value: event.telefono.value, error: event.telefono.value.isNotEmpty ? null : 'Ingresa el Telefono '),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onCorreoChanged(RegisterCorreoChanged event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(
        correo: BlocFormItem(
          value: event.correo.value,
          error: event.correo.value.isNotEmpty ? null : 'Ingresa el Correo ',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onContraseniaChanged(RegisterContraseniaChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
      contrasenia: BlocFormItem(
        value: event.contrasenia.value,
        error:
            event.contrasenia.value.isNotEmpty && event.contrasenia.value.length >= 6 ? null : 'Ingresa La Contraseña ',
      ),
      formKey: formKey,
    ));
  }

  Future<void> _onConfirmaContraseniaChanged(
      RegisterConfirmaContraseniaChanged event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(
        confirmaContrasenia: BlocFormItem(
          value: event.confirmacontrasenia.value,
          error: event.confirmacontrasenia.value.isNotEmpty ? null : 'Confirma contraseña',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onFormSubmit(RegisterFormSubmit event, Emitter<RegisterState> emit) async {
    emit(
      state.copyWith(
        response: Loading(),
        formKey: formKey,
      ),
    );
    Resource response = await authUseCases.register.run(state.toUser());
    emit(
      state.copyWith(
        response: response,
        formKey: formKey,
      ),
    );
  }

  Future<void> _onFormReset(RegisterFormReset event, Emitter<RegisterState> emit) async {
    state.formKey?.currentState?.reset();
  }
}
