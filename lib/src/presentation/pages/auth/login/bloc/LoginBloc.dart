import 'package:app_proyecto_pccalderon/src/domain/models/AuthResponse.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthUseCases authUseCases;
  LoginBloc(this.authUseCases) : super(LoginState()) {
    // registro de stados y eventos con bloc
    on<InitEvent>(_onInitEvent);
    on<CorreoChanged>(_onCorreoChanged);
    on<ContraseniaChanged>(_onContraseniaChanged);
    on<LoginSubmit>(_onLoginSubmit);
    on<LoginFormReset>(_onLoginFormReset);
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(InitEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onLoginFormReset(LoginFormReset event, Emitter<LoginState> emit) async {
    state.formKey?.currentState?.reset();
  }

  Future<void> _onCorreoChanged(CorreoChanged event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        correo:
            BlocFormItem(value: event.correo.value, error: event.correo.value.isNotEmpty ? null : 'Ingresa el Correo '),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onContraseniaChanged(ContraseniaChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      contrasenia: BlocFormItem(
          value: event.contrasenia.value,
          error: event.contrasenia.value.isNotEmpty && event.contrasenia.value.length >= 6
              ? null
              : 'Ingresa La Contraseña '),
      formKey: formKey,
    ));
  }

  Future<void> _onLoginSubmit(LoginSubmit event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      response: Loading(),
      formKey: formKey,
    ));
    Future.delayed(Duration(seconds: 4));
    Resource response = await authUseCases.login
        .run(state.correo.value, state.contrasenia.value); //llamba envano al auth service y se colgaba
    emit(state.copyWith(
      response: response,
      formKey: formKey,
    ));
  }
}
