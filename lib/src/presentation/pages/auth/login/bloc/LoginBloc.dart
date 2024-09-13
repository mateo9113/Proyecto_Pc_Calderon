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
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(InitEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onCorreoChanged(CorreoChanged event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        correo: BlocFormItem(value: event.correo.value),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onContraseniaChanged(ContraseniaChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      contrasenia: BlocFormItem(value: event.contrasenia.value),
      formKey: formKey,
    ));
  }

  Future<void> _onLoginSubmit(LoginSubmit event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      response: Loading(),
      formKey: formKey,
    ));
    Resource response = await authUseCases.login
        .run(state.correo.value, state.contrasenia.value); //llamba envano al auth service y se colgaba
    emit(state.copyWith(
      response: response,
      formKey: formKey,
    ));
  }

  final _responseController = BehaviorSubject<Resource>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<Resource> get responseStream => _responseController.stream;

  //metodos
  void changeEmail(String email) {
    if (email.isNotEmpty && email.length < 6) {
      _emailController.sink.addError('La longitud de caracteres tiene que ser mayor a 6');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 6) {
      _passwordController.sink.addError('error de Contraseña');
    } else {
      _passwordController.sink.add(password);
    }
  }

  Stream<bool> get validateFrom =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true); //combina los resultados
  //combinar para validar

  void login() async {
    _responseController.add(Loading());
    Resource response = await authUseCases.login.run(_emailController.value, _passwordController.value);
    _responseController.add(response);
    Future.delayed(Duration(seconds: 1), () {
      _responseController.add(Initial());
    });
    print('Response : ${response}');
  }

  // metodo para borrar datos
  void dispose() {
//cuando pasemos a otra pantalla
    changeEmail('');
    changePassword('');
  }
}
