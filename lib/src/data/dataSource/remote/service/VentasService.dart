import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_proyecto_pccalderon/src/data/api/ApiConfig.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';

class VentasService {
  Future<String> token;

  VentasService(this.token);

  /// Crear una venta
  Future<Resource<void>> createVenta(Venta venta) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/ventas'); // Ruta del endpoint
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token,
      };

      String body = json.encode(venta.toJson()); // Convertir la venta a JSON

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(null); // Venta creada correctamente
      } else {
        // Manejar errores
        final data = json.decode(response.body);
        return Error(data['message'] ?? 'Error desconocido');
      }
    } catch (e) {
      print('Error al crear la venta: $e');
      return Error(e.toString());
    }
  }

  /// Obtener todas las ventas
  Future<Resource<List<Venta>>> getVentas() async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/ventas'); // Ruta del endpoint
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token,
      };

      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<Venta> ventas = Venta.fromJsonList(data);
        return Success(ventas); // Devuelve la lista de ventas
      } else {
        // Manejar errores
        final data = json.decode(response.body);
        return Error(data['message'] ?? 'Error desconocido');
      }
    } catch (e) {
      print('Error al obtener las ventas: $e');
      return Error(e.toString());
    }
  }
}
