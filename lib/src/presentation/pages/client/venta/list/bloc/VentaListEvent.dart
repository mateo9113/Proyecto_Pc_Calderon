import 'package:equatable/equatable.dart';

// Base class for all VentaList events
abstract class VentaListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Evento para obtener todas las ventas
class GetVentas extends VentaListEvent {
  @override
  List<Object?> get props => [];
}

// Evento para eliminar una venta específica
class DeleteVenta extends VentaListEvent {
  final String ventaId; // ID de la venta a eliminar
  DeleteVenta(this.ventaId);
  @override
  List<Object?> get props => [ventaId];
}
