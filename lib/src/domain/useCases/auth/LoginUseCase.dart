import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/AuthRepository.dart';
import 'package:injectable/injectable.dart';

class LoginUseCase {
  AuthRepository repository;
  LoginUseCase(this.repository);

  run(String email, String password) => repository.login(email, password);
}
