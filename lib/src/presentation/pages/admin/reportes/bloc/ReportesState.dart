import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';
import 'package:equatable/equatable.dart';

abstract class ReportesState extends Equatable {
  @override
  List<Object?> get props => [];
}

// Estado cuando se está cargando
class LoadingReportesState extends ReportesState {}

// Estado de éxito cuando se obtiene el reporte
class SuccessReportesState extends ReportesState {
  final List<Product>? productos;
  final List<Venta>? ventas;
  final String? message;

  SuccessReportesState({this.productos, this.ventas, this.message});

  @override
  List<Object?> get props => [productos, ventas, message];
}

// Estado cuando hay un error al obtener el reporte
class ErrorReportesState extends ReportesState {
  final String errorMessage;

  ErrorReportesState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
