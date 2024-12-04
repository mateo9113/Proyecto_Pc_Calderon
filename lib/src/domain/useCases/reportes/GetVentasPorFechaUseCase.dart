import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ReportesRepository.dart';

class GetVentasPorFechaUseCase {
  final ReportesRepository reportesRepository;

  GetVentasPorFechaUseCase(this.reportesRepository);

  // Método run() para obtener el reporte de ventas por fecha
  run(String rango) => reportesRepository.getVentasPorFecha(rango);
}
