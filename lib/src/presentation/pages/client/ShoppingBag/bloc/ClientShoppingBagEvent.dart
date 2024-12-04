import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:equatable/equatable.dart';

abstract class ClientShoppingBagEvent extends Equatable {
  const ClientShoppingBagEvent();
  @override
  List<Object?> get props => [];
}

class GetShoppingBag extends ClientShoppingBagEvent {
  const GetShoppingBag();
}

class AddItem extends ClientShoppingBagEvent {
  final Product product;
  const AddItem({required this.product});
  @override
  List<Object?> get props => [product];
}

class SubtractItem extends ClientShoppingBagEvent {
  final Product product;
  const SubtractItem({required this.product});
  @override
  List<Object?> get props => [product];
}

class RemoveItem extends ClientShoppingBagEvent {
  final Product product;
  const RemoveItem({required this.product});
  @override
  List<Object?> get props => [product];
}

class GetTotal extends ClientShoppingBagEvent {
  const GetTotal();
}

class GetClients extends ClientShoppingBagEvent {
  const GetClients();
}

class SelectClient extends ClientShoppingBagEvent {
  final Cliente selectedClient;
  const SelectClient({required this.selectedClient});
  @override
  List<Object?> get props => [selectedClient];
}

class CreateVenta extends ClientShoppingBagEvent {
  final double total;
  const CreateVenta({required this.total});
  @override
  List<Object?> get props => [total];
}

class UpdateDiscount extends ClientShoppingBagEvent {
  final double descuento;

  const UpdateDiscount({required this.descuento});

  @override
  List<Object?> get props => [descuento];
}

class ResetDiscount extends ClientShoppingBagEvent {
  ResetDiscount();
}
