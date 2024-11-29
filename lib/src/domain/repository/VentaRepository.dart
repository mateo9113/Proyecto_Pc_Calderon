import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/VentaDetalle.dart';

abstract class VentaRepository {
  Future<void> createVenta(Venta venta); // Crear una venta
  Future<Resource<List<VentaDetalle>>> getVentas(); // Obtener todas las ventas
  Future<Resource<bool>> deleteVenta(int id);
}
