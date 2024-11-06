import 'package:equatable/equatable.dart';

abstract class ClienteListEvent extends Equatable {
  const ClienteListEvent();
  @override
  List<Object?> get props => [];
}

class LoadClientes extends ClienteListEvent {
  const LoadClientes();
}

class DeleteCliente extends ClienteListEvent {
  final int id;
  const DeleteCliente({required this.id});
  @override
  List<Object?> get props => [id];
}
