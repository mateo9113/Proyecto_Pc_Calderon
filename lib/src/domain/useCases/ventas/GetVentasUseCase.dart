import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/VentaRepository.dart';

class GetVentasUseCase {
  final VentaRepository ventaRepository;

  GetVentasUseCase(this.ventaRepository);

  Future<List<Venta>> run() async {
    return await ventaRepository.getVentas();
  }
}
