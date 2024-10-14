import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';
import 'package:equatable/equatable.dart';

class ProfileInfoState extends Equatable {
  final Usuario? usuario;

  const ProfileInfoState({this.usuario});

  ProfileInfoState copyWith({Usuario? usuario}) {
    return ProfileInfoState(usuario: usuario);
  }

  @override
  List<Object?> get props => [usuario];
}
