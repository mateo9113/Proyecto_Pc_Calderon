import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ReportesRepository.dart';

class GetProductosMasVendidosUseCase {
  final ReportesRepository reportesRepository;

  GetProductosMasVendidosUseCase(this.reportesRepository);

  // Método run() para obtener los productos más vendidos
  run() => reportesRepository.getProductosMasVendidos();
}
