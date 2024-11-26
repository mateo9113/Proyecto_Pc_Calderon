import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/VentaRepository.dart';

class CreateVentaUseCase {
  final VentaRepository ventaRepository;

  CreateVentaUseCase(this.ventaRepository);

  Future<void> run(Venta venta) async {
    await ventaRepository.createVenta(venta);
  }
}
