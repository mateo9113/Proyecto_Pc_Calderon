import 'package:app_proyecto_pccalderon/src/domain/repository/ClienteRepository.dart';

class DeleteClienteUseCase {
  final ClienteRepository clienteRepository;

  DeleteClienteUseCase(this.clienteRepository);

  // Future<void> run(int id) => clienteRepository.delete(id);
  run(int id) => clienteRepository.delete(id);
}
