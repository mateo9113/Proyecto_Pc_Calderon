import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';

abstract class VentaRepository {
  Future<void> createVenta(Venta venta); // Crear una venta
  Future<List<Venta>> getVentas(); // Obtener todas las ventas
}
