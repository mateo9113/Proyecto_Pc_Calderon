import 'package:app_proyecto_pccalderon/src/domain/repository/VentaRepository.dart';

class DeleteVentaUseCase {
  final VentaRepository ventaRepository;

  DeleteVentaUseCase(this.ventaRepository);

  // Future<void> run(int id) => clienteRepository.delete(id);
  run(int id) => ventaRepository.deleteVenta(id);
}
