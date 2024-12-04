import 'package:app_proyecto_pccalderon/src/domain/repository/ReportesRepository.dart';

class GetReporteProductosUseCase {
  final ReportesRepository reportesRepository;

  GetReporteProductosUseCase(this.reportesRepository);

  // Método run() para obtener el reporte de productos
  run() => reportesRepository.getReporteProductos();
}
