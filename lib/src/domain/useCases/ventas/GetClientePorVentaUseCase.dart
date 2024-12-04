import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ClienteRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';

class GetClientePorVentaUseCase {
  final ClienteRepository clienteRepository;

  GetClientePorVentaUseCase(this.clienteRepository);

  Future<Resource<Cliente>> run(int idCliente) {
    return clienteRepository.getClienteById(idCliente);
  }
}
