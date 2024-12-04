import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ReportesRepository.dart';

class GetVentasPorClienteUseCase {
  final ReportesRepository reportesRepository;

  GetVentasPorClienteUseCase(this.reportesRepository);

  // Método run() para obtener el reporte de ventas por cliente
  run(int idClient) => reportesRepository.getVentasPorCliente(idClient);
}
