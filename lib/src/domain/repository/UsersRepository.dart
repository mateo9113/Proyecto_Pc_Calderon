import 'dart:io';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';

abstract class UsersRepository {
  Future<Resource<Usuario>> update(int id, Usuario usuario, File? image);
}
