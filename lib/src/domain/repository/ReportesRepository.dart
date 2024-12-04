import 'dart:io';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Inventario.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';

abstract class ReportesRepository {
  Future<Resource<List<Cliente>>> getReporteClientes();
  Future<Resource<List<Product>>> getReporteProductos();
  Future<Resource<List<Venta>>> getReporteVentas();
  Future<Resource<List<Inventario>>> getReporteInventario();
  Future<Resource<List<Product>>> getProductosMasVendidos();
  Future<Resource<List<Venta>>> getVentasPorCliente(int idClient);
  Future<Resource<List<Venta>>> getVentasPorFecha(String rango);
  Future<Resource<Map<String, dynamic>>> getProforma(int id);
}
