import 'dart:io';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/UsersService.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/UsersRepository.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersService usersService;

  UsersRepositoryImpl(this.usersService);

  @override
  Future<Resource<Usuario>> update(int id, Usuario usuario, File? image) {
    if (image == null) {
      return usersService.update(id, usuario);
    } else {
      return usersService.updateImage(id, usuario, image);
    }
  }
}
