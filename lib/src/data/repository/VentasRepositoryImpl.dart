import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/VentasService.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';
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
  Future<List<Venta>> getVentas() async {
    final result = await ventasService.getVentas();
    if (result is Success<List<Venta>>) {
      return result.data;
    } else if (result is Error) {
      throw Exception(result.message);
    }
    return [];
  }
}
