import 'dart:convert';
import 'package:app_proyecto_pccalderon/src/data/api/ApiConfig.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Inventario.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';
import 'package:http/http.dart' as http;

class ReportesService {
  final String baseUrl = ApiConfig.API_PROYECTO; // Asegúrate que API_PROYECTO esté correctamente configurado

  // Método para obtener todos los clientes
  Future<List<Cliente>> getReporteClientes() async {
    final response = await http.get(Uri.parse('$baseUrl/reportes/clientes')); // Ajuste de la ruta

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => Cliente.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load clients');
    }
  }

  // Método para obtener productos más vendidos
  Future<List<Product>> getReporteProductos() async {
    final response = await http.get(Uri.parse('$baseUrl/reportes/productos')); // Ajuste de la ruta

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Método para obtener ventas
  Future<List<Venta>> getReporteVentas() async {
    final response = await http.get(Uri.parse('$baseUrl/reportes/ventas')); // Ajuste de la ruta

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => Venta.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load sales');
    }
  }

  // Método para obtener productos más vendidos
  Future<List<Product>> getProductosMasVendidos() async {
    final response = await http.get(Uri.parse('$baseUrl/reportes/productos/mas-vendidos')); // Ajuste de la ruta

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load best-selling products');
    }
  }

  // Método para obtener ventas por cliente
  Future<List<Venta>> getVentasPorCliente(int idClient) async {
    final response = await http.get(Uri.parse('$baseUrl/reportes/ventas/cliente/$idClient')); // Ajuste de la ruta

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => Venta.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load sales for client');
    }
  }

  // Método para obtener ventas por rango de fecha
  Future<List<Venta>> getVentasPorFecha(String rango) async {
    final response = await http.get(Uri.parse('$baseUrl/reportes/ventas/fecha?rango=$rango')); // Ajuste de la ruta

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => Venta.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load sales by date range');
    }
  }

  // Método para obtener el reporte de inventario
  Future<List<Inventario>> getReporteInventario() async {
    final response = await http.get(Uri.parse('$baseUrl/reportes/inventario')); // Ajuste de la ruta

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => Inventario.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load inventory');
    }
  }

  // Método para obtener la proforma de una venta específica
  Future<Map<String, dynamic>> getProforma(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/reportes/proforma/$id')); // Ajuste de la ruta

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load proforma');
    }
  }
}
