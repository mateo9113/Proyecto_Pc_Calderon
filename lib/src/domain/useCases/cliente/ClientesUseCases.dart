import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/CreateClienteUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/DeleteClienteUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/GetClientesUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/UpdateClienteUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/GetClienteByIdUseCase.dart';

class ClientesUseCases {
  final CreateClienteUseCase create;
  final UpdateClienteUseCase update;
  final GetClientesUseCase getClientes;
  final DeleteClienteUseCase delete;
  final GetClienteByIdUseCase getClienteById; // Añadido caso de uso para obtener cliente por ID

  ClientesUseCases({
    required this.create,
    required this.update,
    required this.getClientes,
    required this.delete,
    required this.getClienteById, // Inicialización de GetClienteByIdUseCase
  });
}
