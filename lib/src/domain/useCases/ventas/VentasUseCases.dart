import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/CreateVentaUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/DeleteVentaUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/GetVentasUseCase.dart';

class VentasUseCases {
  final CreateVentaUseCase createVenta;
  final GetVentasUseCase getVentas;
  final DeleteVentaUseCase deleteVenta;

  VentasUseCases({required this.createVenta, required this.getVentas, required this.deleteVenta});
}
