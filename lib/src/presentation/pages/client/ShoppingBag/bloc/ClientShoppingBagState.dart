import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:equatable/equatable.dart';

class ClientShoppingBagState extends Equatable {
  final List<Product> products;
  final double total;
  final List<Cliente>? clients; // Lista de clientes
  final Cliente? selectedClient; // Cliente seleccionado
  final String? errorMessage; // Nuevo campo para manejar errores

  const ClientShoppingBagState({
    this.products = const [],
    this.total = 0,
    this.clients,
    this.selectedClient,
    this.errorMessage,
  });

  ClientShoppingBagState copyWith({
    List<Product>? products,
    double? total,
    List<Cliente>? clients,
    Cliente? selectedClient,
    String? errorMessage, // Añadido aquí
  }) {
    return ClientShoppingBagState(
      products: products ?? this.products,
      total: total ?? this.total,
      clients: clients ?? this.clients,
      selectedClient: selectedClient ?? this.selectedClient,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [products, total, clients, selectedClient, errorMessage];
}
