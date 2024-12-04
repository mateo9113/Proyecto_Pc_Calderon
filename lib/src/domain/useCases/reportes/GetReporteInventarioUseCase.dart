import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Inventario.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ReportesRepository.dart';

class GetReporteInventarioUseCase {
  final ReportesRepository reportesRepository;

  GetReporteInventarioUseCase(this.reportesRepository);

  // Método run() para obtener el reporte de inventario
  run() => reportesRepository.getReporteInventario();
}
