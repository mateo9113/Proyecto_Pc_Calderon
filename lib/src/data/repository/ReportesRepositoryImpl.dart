import 'dart:io';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Inventario.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ReportesRepository.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/ReporteService.dart';



class ReportesRepositoryImpl implements ReportesRepository {
  final ReportesService reportesService;

  ReportesRepositoryImpl(this.reportesService);

  @override
  Future<Resource<List<Cliente>>> getReporteClientes() async {
    try {
      final data = await reportesService.getReporteClientes();
      return Success(data);
    } on SocketException {
      return Error('No se pudo establecer conexión a Internet');
    } catch (e) {
      return Error('Error al obtener el reporte de clientes: ${e.toString()}');
    }
  }

  @override
  Future<Resource<List<Product>>> getReporteProductos() async {
    try {
      final data = await reportesService.getReporteProductos();
      return Success(data);
    } on SocketException {
      return Error('No se pudo establecer conexión a Internet');
    } catch (e) {
      return Error('Error al obtener el reporte de productos: ${e.toString()}');
    }
  }

  @override
  Future<Resource<List<Venta>>> getReporteVentas() async {
    try {
      final data = await reportesService.getReporteVentas();
      return Success(data);
    } on SocketException {
      return Error('No se pudo establecer conexión a Internet');
    } catch (e) {
      return Error('Error al obtener el reporte de ventas: ${e.toString()}');
    }
  }

  @override
  Future<Resource<List<Inventario>>> getReporteInventario() async {
    try {
      final data = await reportesService.getReporteInventario();
      return Success(data);
    } on SocketException {
      return Error('No se pudo establecer conexión a Internet');
    } catch (e) {
      return Error('Error al obtener el reporte de inventario: ${e.toString()}');
    }
  }

  @override
  Future<Resource<List<Product>>> getProductosMasVendidos() async {
    try {
      final data = await reportesService.getProductosMasVendidos();
      return Success(data);
    } on SocketException {
      return Error('No se pudo establecer conexión a Internet');
    } catch (e) {
      return Error('Error al obtener los productos más vendidos: ${e.toString()}');
    }
  }

  @override
  Future<Resource<List<Venta>>> getVentasPorCliente(int idClient) async {
    try {
      final data = await reportesService.getVentasPorCliente(idClient);
      return Success(data);
    } on SocketException {
      return Error('No se pudo establecer conexión a Internet');
    } catch (e) {
      return Error('Error al obtener las ventas por cliente: ${e.toString()}');
    }
  }

  @override
  Future<Resource<List<Venta>>> getVentasPorFecha(String rango) async {
    try {
      final data = await reportesService.getVentasPorFecha(rango);
      return Success(data);
    } on SocketException {
      return Error('No se pudo establecer conexión a Internet');
    } catch (e) {
      return Error('Error al obtener ventas por fecha: ${e.toString()}');
    }
  }

  @override
  Future<Resource<Map<String, dynamic>>> getProforma(int id) async {
    try {
      final data = await reportesService.getProforma(id);
      return Success(data);
    } on SocketException {
      return Error('No se pudo establecer conexión a Internet');
    } catch (e) {
      return Error('Error al obtener la proforma: ${e.toString()}');
    }
  }
}
