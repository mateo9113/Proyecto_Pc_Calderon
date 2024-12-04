import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetReporteClientesUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetReporteProductosUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetReporteVentasUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetReporteInventarioUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetProductosMasVendidosUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetVentasPorClienteUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetVentasPorFechaUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetProformaUseCase.dart';

class ReportesUseCases {
  final GetReporteClientesUseCase getReporteClientes;
  final GetReporteProductosUseCase getReporteProductos;
  final GetReporteVentasUseCase getReporteVentas;
  final GetReporteInventarioUseCase getReporteInventario;
  final GetProductosMasVendidosUseCase getProductosMasVendidos;
  final GetVentasPorClienteUseCase getVentasPorCliente;
  final GetVentasPorFechaUseCase getVentasPorFecha;
  final GetProformaUseCase getProforma;

  // Constructor que inicializa todos los casos de uso
  ReportesUseCases({
    required this.getReporteClientes,
    required this.getReporteProductos,
    required this.getReporteVentas,
    required this.getReporteInventario,
    required this.getProductosMasVendidos,
    required this.getVentasPorCliente,
    required this.getVentasPorFecha,
    required this.getProforma,
  });
}
