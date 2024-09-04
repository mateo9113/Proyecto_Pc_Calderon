import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/AuthService.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/AuthRepository.dart';
import 'package:injectable/injectable.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthService authService;

  AuthRepositoryImpl(this.authService);

  @override
  Future<Resource> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource> register(Usuario usuario) {
    return authService.register(usuario);
  }
}
