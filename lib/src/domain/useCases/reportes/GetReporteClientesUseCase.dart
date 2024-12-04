import 'package:app_proyecto_pccalderon/src/domain/repository/ReportesRepository.dart';

class GetReporteClientesUseCase {
  final ReportesRepository reportesRepository;

  GetReporteClientesUseCase(this.reportesRepository);

  // Método run() para obtener el reporte de clientes
  run() => reportesRepository.getReporteClientes();
}
