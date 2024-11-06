import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ClienteRepository.dart';

class CreateClienteUseCase {
  final ClienteRepository clienteRepository;

  CreateClienteUseCase(this.clienteRepository);

  run(Cliente cliente) => clienteRepository.create(cliente);
}
