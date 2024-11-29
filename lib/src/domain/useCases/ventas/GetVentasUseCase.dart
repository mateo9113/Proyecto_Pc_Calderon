import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/VentaDetalle.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/VentaRepository.dart';

class GetVentasUseCase {
  final VentaRepository ventaRepository;

  GetVentasUseCase(this.ventaRepository);

  Future<Resource<List<VentaDetalle>>> run() => ventaRepository.getVentas();
}
