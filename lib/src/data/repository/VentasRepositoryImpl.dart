import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/VentasService.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/VentaDetalle.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/VentaRepository.dart';

import '../../domain/Utils/Resource.dart';

class VentaRepositoryImpl implements VentaRepository {
  final VentasService ventasService;

  VentaRepositoryImpl(this.ventasService);

  @override
  Future<void> createVenta(Venta venta) async {
    final result = await ventasService.createVenta(venta);
    if (result is Error) {
      throw Exception(result.message);
    }
  }

  @override
  Future<Resource<List<VentaDetalle>>> getVentas() async {
    return await ventasService.getVentas();
  }

  @override
  Future<Resource<bool>> deleteVenta(int id) {
    return ventasService.deleteVenta(id);
  }
}
