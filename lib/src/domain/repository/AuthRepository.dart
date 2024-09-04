import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';

abstract class AuthRepository {
  Future<Resource> login(String email, String password);
  Future<Resource> register(Usuario usuario);
}