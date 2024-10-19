import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileUpdateEvent extends Equatable {
  const ProfileUpdateEvent();

  @override
  List<Object?> get props => [];
}

class ProfileUpdateInitEvent extends ProfileUpdateEvent {
  final Usuario? usuario;
  const ProfileUpdateInitEvent({required this.usuario});
  @override
  // TODO: implement props
  List<Object?> get props => [usuario];
}

class ProfileUpdateUpdateUserSession extends ProfileUpdateEvent {
  final Usuario usuario;

  const ProfileUpdateUpdateUserSession({required this.usuario});

  @override
  List<Object?> get props => [usuario];
}

class ProfileUpdateNameChanged extends ProfileUpdateEvent {
  final BlocFormItem nombre;
  const ProfileUpdateNameChanged({required this.nombre});
  @override
  List<Object?> get props => [nombre];
}

class ProfileUpdateLastnameChanged extends ProfileUpdateEvent {
  final BlocFormItem apellido;
  const ProfileUpdateLastnameChanged({required this.apellido});
  @override
  List<Object?> get props => [apellido];
}

class ProfileUpdatePhoneChanged extends ProfileUpdateEvent {
  final BlocFormItem telefono;
  const ProfileUpdatePhoneChanged({required this.telefono});
  @override
  List<Object?> get props => [telefono];
}

class ProfileUpdateFormSubmit extends ProfileUpdateEvent {
  const ProfileUpdateFormSubmit();
}

class ProfileUpdatePickImage extends ProfileUpdateEvent {
  const ProfileUpdatePickImage();
}

class ProfileUpdateTakePhoto extends ProfileUpdateEvent {
  const ProfileUpdateTakePhoto();
}
