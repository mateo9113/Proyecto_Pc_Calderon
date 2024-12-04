import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ReportesRepository.dart';

class GetReporteVentasUseCase {
  final ReportesRepository reportesRepository;

  GetReporteVentasUseCase(this.reportesRepository);

  // Método run() para obtener el reporte de ventas
  run() => reportesRepository.getReporteVentas();
}
