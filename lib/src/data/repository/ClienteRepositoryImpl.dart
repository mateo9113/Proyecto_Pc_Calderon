import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/ClienteService.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ClienteRepository.dart';

class ClienteRepositoryImpl implements ClienteRepository {
  final ClienteService clienteService;

  ClienteRepositoryImpl(this.clienteService);

  @override
  Future<Resource<Cliente>> create(Cliente cliente) {
    return clienteService.create(cliente);
  }

  @override
  Future<Resource<List<Cliente>>> getClientes() {
    return clienteService.getClientes();
  }

  @override
  Future<Resource<Cliente>> update(int id, Cliente cliente) {
    return clienteService.update(id, cliente);
  }

  @override
  Future<Resource<bool>> delete(int id) {
    return clienteService.delete(id);
  }

  // Implementamos el método para obtener el cliente por ID
  @override
  Future<Resource<Cliente>> getClienteById(int id) {
    return clienteService.getClienteById(id);
  }
}
