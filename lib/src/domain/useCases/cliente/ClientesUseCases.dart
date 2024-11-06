import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/CreateClienteUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/DeleteClienteUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/GetClientesUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/UpdateClienteUseCase.dart';

class ClientesUseCases {
  final CreateClienteUseCase create;
  final UpdateClienteUseCase update;
  final GetClientesUseCase getClientes;
  final DeleteClienteUseCase delete;

  ClientesUseCases({
    required this.create,
    required this.update,
    required this.getClientes,
    required this.delete,
  });
}
