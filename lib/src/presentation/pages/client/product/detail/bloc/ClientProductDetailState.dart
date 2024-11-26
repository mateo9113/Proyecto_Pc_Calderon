import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:equatable/equatable.dart';

class ClientProductDetailState extends Equatable {
  final Product? product; // Producto puede ser null inicialmente
  final int quantity;
  final String? errorMessage;

  const ClientProductDetailState({
    this.product,
    this.quantity = 0,
    this.errorMessage,
  });

  ClientProductDetailState copyWith({
    Product? product,
    int? quantity,
    String? errorMessage,
  }) {
    return ClientProductDetailState(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [product, quantity, errorMessage];
}
