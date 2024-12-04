import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart'; // Importamos Cliente
import 'package:equatable/equatable.dart';

class VentaListState extends Equatable {
  final Resource? response; // Respuesta de las ventas
  final Map<int, Cliente> clientes; // Clientes asociados a las ventas

  const VentaListState({
    this.response,
    this.clientes = const {}, // Inicializamos el mapa vacío
  });

  VentaListState copyWith({
    Resource? response,
    Map<int, Cliente>? clientes,
  }) {
    return VentaListState(
      response: response ?? this.response,
      clientes: clientes ?? this.clientes,
    );
  }

  @override
  List<Object?> get props => [response, clientes];
}
