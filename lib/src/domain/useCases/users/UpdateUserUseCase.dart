import 'dart:io';

import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/UsersRepository.dart';

class UpdateUserUseCase {
  UsersRepository usersRepository;

  UpdateUserUseCase(this.usersRepository);

  run(int id, Usuario usuario, File? file) => usersRepository.update(id, usuario, file);
}
