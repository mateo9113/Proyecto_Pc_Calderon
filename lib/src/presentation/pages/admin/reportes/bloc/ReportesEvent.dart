import 'package:equatable/equatable.dart';

abstract class ReportesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Evento para obtener todos los clientes
class GetReporteClientesEvent extends ReportesEvent {}

// Evento para obtener todos los productos
class GetReporteProductosEvent extends ReportesEvent {}

// Evento para obtener todas las ventas
class GetReporteVentasEvent extends ReportesEvent {}

// Evento para obtener el inventario
class GetReporteInventarioEvent extends ReportesEvent {}

// Evento para obtener los productos más vendidos
class GetProductosMasVendidosEvent extends ReportesEvent {}

// Evento para obtener las ventas por cliente
class GetVentasPorClienteEvent extends ReportesEvent {
  final int idCliente;
  GetVentasPorClienteEvent(this.idCliente);

  @override
  List<Object?> get props => [idCliente];
}

// Evento para obtener las ventas por fecha
class GetVentasPorFechaEvent extends ReportesEvent {
  final String rango;
  GetVentasPorFechaEvent(this.rango);

  @override
  List<Object?> get props => [rango];
}

// Evento para obtener la proforma
class GetProformaEvent extends ReportesEvent {
  final int id;
  GetProformaEvent(this.id);

  @override
  List<Object?> get props => [id];
}
