import 'package:app_proyecto_pccalderon/src/domain/repository/AuthRepository.dart';

class LoginUseCase {
  AuthRepository repository;
  LoginUseCase(this.repository);

  run(String email, String password) => repository.login(email, password);
}
