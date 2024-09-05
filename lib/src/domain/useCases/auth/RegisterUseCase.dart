import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/AuthRepository.dart';

class RegisterUseCase {
  AuthRepository repository;

  RegisterUseCase(this.repository);

  run(Usuario usuario) => repository.register(usuario);
}
