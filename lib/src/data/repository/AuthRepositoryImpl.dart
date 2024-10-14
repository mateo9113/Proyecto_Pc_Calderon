import 'package:app_proyecto_pccalderon/src/data/dataSource/local/SharedPref.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/AuthService.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/AuthResponse.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthService authService;
  SharedPref sharedPref;

  AuthRepositoryImpl(this.authService, this.sharedPref);

  @override
  Future<Resource> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource> register(Usuario usuario) {
    return authService.register(usuario);
  }

  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharedPref.read('usuario');
    if (data != null) {
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }
    return null;
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    sharedPref.save('usuario', authResponse.toJson());
  }

  @override
  Future<bool> logout() async {
    return await sharedPref.remove('usuario');
  }
}
