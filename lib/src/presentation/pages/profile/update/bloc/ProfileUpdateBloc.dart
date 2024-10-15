import 'dart:io';
// import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
// import 'package:app_proyecto_pccalderon/src/domain/models/AuthResponse.dart';
// import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/AuthUseCases.dart';
// import 'package:app_proyecto_pccalderon/src/domain/useCases/users/UsersUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/users/UsersUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  UsersUseCases usersUseCases;
  // AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();

  ProfileUpdateBloc(this.usersUseCases /*, this.authUseCases*/) : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>(_onInitEvent);
    on<ProfileUpdateNameChanged>(_onNameChanged);
    on<ProfileUpdateLastnameChanged>(_onLastnameChanged);
    on<ProfileUpdatePhoneChanged>(_onPhoneChanged);
    on<ProfileUpdatePickImage>(_onPickImage);
    on<ProfileUpdateTakePhoto>(_onTakePhoto);
    on<ProfileUpdateFormSubmit>(_onFormSubmit);
    // on<ProfileUpdateUpdateUserSession>(_onUpdateUserSession);
  }

  Future<void> _onInitEvent(ProfileUpdateInitEvent event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(
      id: event.usuario?.id,
      nombre: BlocFormItem(value: event.usuario?.nombre ?? ''),
      apellido: BlocFormItem(value: event.usuario?.apellido ?? ''),
      telefono: BlocFormItem(value: event.usuario?.telefono ?? ''),
      formKey: formKey,
    ));
  }

  // Future<void> _onUpdateUserSession(ProfileUpdateUpdateUserSession event, Emitter<ProfileUpdateState> emit) async {
  //   AuthResponse authResponse = await authUseCases.getUserSession.run(); // USUARIO SESION
  //   authResponse.usuario.nombre = event.usuario.nombre;
  //   authResponse.usuario.apellido = event.usuario.apellido;
  //   authResponse.usuario.telefono = event.usuario.telefono;
  //   authResponse.usuario.imagen = event.usuario.imagen;
  //   await authUseCases.saveUserSession.run(authResponse);
  // }

  Future<void> _onFormSubmit(ProfileUpdateFormSubmit event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(
      response: Loading(),
      formKey: formKey,
    ));
    Resource response = await usersUseCases.updateUser.run(state.id, state.toUser(), state.imagen);
    emit(state.copyWith(
      response: response,
      formKey: formKey,
    ));
  }

  Future<void> _onPickImage(ProfileUpdatePickImage event, Emitter<ProfileUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagen = await picker.pickImage(source: ImageSource.gallery);
    if (imagen != null) {
      emit(state.copyWith(
        imagen: File(imagen.path),
        formKey: formKey,
      ));
    }
  }

  Future<void> _onTakePhoto(ProfileUpdateTakePhoto event, Emitter<ProfileUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagen = await picker.pickImage(source: ImageSource.camera);
    if (imagen != null) {
      emit(
        state.copyWith(
          imagen: File(imagen.path),
          formKey: formKey,
        ),
      );
    }
  }

  Future<void> _onNameChanged(ProfileUpdateNameChanged event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(
        nombre: BlocFormItem(
          value: event.nombre.value,
          error: event.nombre.value.isNotEmpty ? null : 'Ingresa el nombre',
        ),
        formKey: formKey));
  }

  Future<void> _onLastnameChanged(ProfileUpdateLastnameChanged event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(
        apellido: BlocFormItem(
          value: event.apellido.value,
          error: event.apellido.value.isNotEmpty ? null : 'Ingresa el Apellido',
        ),
        formKey: formKey));
  }

  Future<void> _onPhoneChanged(ProfileUpdatePhoneChanged event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(
        telefono: BlocFormItem(
          value: event.telefono.value,
          error: event.telefono.value.isNotEmpty ? null : 'Ingresa el telefono',
        ),
        formKey: formKey));
  }
}
