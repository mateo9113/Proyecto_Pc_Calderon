import 'package:app_proyecto_pccalderon/src/domain/models/Role.dart';
import 'package:equatable/equatable.dart';

class RolesState extends Equatable {
  final List<Role?>? roles;
  const RolesState({this.roles});

  RolesState copyWith({final List<Role?>? roles}) {
    return RolesState(roles: roles);
  }

  @override
  List<Object?> get props => [roles];
}
