import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:equatable/equatable.dart';

abstract class ClientProductDetailEvent extends Equatable {
  const ClientProductDetailEvent();
  @override
  List<Object?> get props => [];
}

class CheckProductStock extends ClientProductDetailEvent {
  final Product product;

  const CheckProductStock(this.product);

  @override
  List<Object?> get props => [product];
}

class ResetState extends ClientProductDetailEvent {
  const ResetState();
}

class GetProducts extends ClientProductDetailEvent {
  final Product product;
  const GetProducts({required this.product});
  @override
  List<Object?> get props => [product];
}

class AddItem extends ClientProductDetailEvent {
  final Product product;

  const AddItem(this.product);

  @override
  List<Object?> get props => [product];
}

class SubtractItem extends ClientProductDetailEvent {
  const SubtractItem(Product product);
  @override
  List<Object?> get props => [];
}

class AddProductToShoppingBag extends ClientProductDetailEvent {
  final Product product;
  const AddProductToShoppingBag({required this.product});
  @override
  List<Object?> get props => [product];
}
