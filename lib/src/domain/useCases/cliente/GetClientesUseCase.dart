import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ClienteRepository.dart';

class GetClientesUseCase {
  final ClienteRepository clienteRepository;

  GetClientesUseCase(this.clienteRepository);

  Future<Resource<List<Cliente>>> run() => clienteRepository.getClientes();
}
