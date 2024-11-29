import 'dart:convert';
import 'package:app_proyecto_pccalderon/src/domain/Utils/ListToString.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/VentaDetalle.dart';
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

  Future<Resource<List<VentaDetalle>>> getVentas() async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/ventas'); // Ruta del endpoint
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token,
      };

      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<VentaDetalle> ventas = VentaDetalle.fromJsonList(data);
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

  Future<Resource<bool>> deleteVenta(int id) async {
    try {
      // Aquí la URL se adapta a la eliminación de ventas
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/venta/$id');

      // Los encabezados que incluyen el token de autorización
      Map<String, String> headers = {"Content-Type": "application/json", "Authorization": await token};

      // Hacemos la solicitud HTTP DELETE
      final response = await http.delete(url, headers: headers);

      // Verificamos si la respuesta es exitosa (200 o 201)
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(true); // Si la eliminación fue exitosa
      } else {
        // Si el servidor respondió con un error
        final data = json.decode(response.body);
        return Error(listToString(data['message'])); // Retorna el mensaje de error
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString()); // Si ocurre algún error durante la llamada HTTP
    }
  }
}
