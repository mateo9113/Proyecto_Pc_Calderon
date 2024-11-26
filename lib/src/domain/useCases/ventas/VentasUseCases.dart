import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/CreateVentaUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/GetVentasUseCase.dart';

class VentasUseCases {
  final CreateVentaUseCase createVenta;
  final GetVentasUseCase getVentas;

  VentasUseCases({
    required this.createVenta,
    required this.getVentas,
  });
}
