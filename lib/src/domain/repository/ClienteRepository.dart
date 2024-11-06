import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';

abstract class ClienteRepository {
  Future<Resource<Cliente>> create(Cliente cliente);
  Future<Resource<Cliente>> update(int id, Cliente cliente);
  Future<Resource<List<Cliente>>> getClientes();
  Future<Resource<bool>> delete(int id);
}
