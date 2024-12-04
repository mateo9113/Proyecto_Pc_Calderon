import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ReportesRepository.dart';

class GetProformaUseCase {
  final ReportesRepository reportesRepository;

  GetProformaUseCase(this.reportesRepository);

  // Método run() para obtener el reporte de proforma
  run(int idProforma) => reportesRepository.getProforma(idProforma);
}
