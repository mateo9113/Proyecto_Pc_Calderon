import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';

class LoginUseCase {
  AuthRepositoryImpl authRepository = AuthRepositoryImpl();

  run(String email, String password) => authRepository.login(email, password);
}
