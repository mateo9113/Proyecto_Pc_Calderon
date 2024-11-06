import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ClienteRepository.dart';

class UpdateClienteUseCase {
  final ClienteRepository clienteRepository;

  UpdateClienteUseCase(this.clienteRepository);

  run(int id, Cliente cliente) => clienteRepository.update(id, cliente);
}
