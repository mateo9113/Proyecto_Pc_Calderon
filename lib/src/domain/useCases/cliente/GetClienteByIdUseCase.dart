import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ClienteRepository.dart';

class GetClienteByIdUseCase {
  final ClienteRepository clienteRepository;

  GetClienteByIdUseCase(this.clienteRepository);

  // Ejecutar el caso de uso para obtener un cliente por ID
  Future<Resource<Cliente>> run(int idCliente) {
    return clienteRepository.getClienteById(idCliente);
  }
}
