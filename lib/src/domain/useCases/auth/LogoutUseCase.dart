import 'package:app_proyecto_pccalderon/src/domain/repository/AuthRepository.dart';

class LogoutUseCase {
  AuthRepository repository;

  LogoutUseCase(this.repository);

  run() => repository.logout();
}
