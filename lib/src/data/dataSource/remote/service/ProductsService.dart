import 'dart:convert';
import 'dart:io';
import 'package:app_proyecto_pccalderon/src/data/api/ApiConfig.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/ListToString.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class ProductsService {
  Future<String> token;

  ProductsService(this.token);

  Future<Resource<Product>> create(Product product, List<File> files) async {
    try {
      // http://192.168.80.13:3000/users/5
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/producto');

      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = await token;
      files.forEach((file) async {
        request.files.add(http.MultipartFile('files[]', http.ByteStream(file.openRead().cast()), await file.length(),
            filename: basename(file.path), contentType: MediaType('image', 'jpg')));
      });
      request.fields['nombre'] = product.nombre;
      request.fields['descripcion'] = product.descripcion;
      request.fields['precio'] = product.precio.toString();
      request.fields['id_categoria'] = product.id_categoria.toString();
      request.fields['stock'] = product.stock.toString();
      final response = await request.send();
      final data = json.decode(await response.stream.transform(utf8.decoder).first);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Product productResponse = Product.fromJson(data);
        return Success(productResponse);
      } else {
        // ERROR
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<List<Product>>> getProductsByCategory(int idCategoria) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/producto/category/$idCategoria');
      Map<String, String> headers = {"Content-Type": "application/json", "Authorization": await token};
      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Product> products = Product.fromJsonList(data);
        return Success(products);
      } else {
        // ERROR
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Product>> update(int id, Product product) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/producto/$id');
      Map<String, String> headers = {"Content-Type": "application/json", "Authorization": await token};
      String body = json.encode({
        'nombre': product.nombre,
        'descripcion': product.descripcion,
        'precio': product.precio,
        'stock': product.stock,
      });
      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Product productResponse = Product.fromJson(data);
        return Success(productResponse);
      } else {
        // ERROR
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Product>> updateImage(int id, Product product, List<File> files, List<int> imagesToUpdate) async {
    try {
      // http://192.168.80.13:3000/users/5
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/producto/upload/$id');

      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] = await token;
      files.forEach((file) async {
        request.files.add(http.MultipartFile('files[]', http.ByteStream(file.openRead().cast()), await file.length(),
            filename: basename(file.path), contentType: MediaType('image', 'jpg')));
      });
      request.fields['nombre'] = product.nombre;
      request.fields['descripcion'] = product.descripcion;
      request.fields['precio'] = product.precio.toString();
      request.fields['stock'] = product.stock.toString();
      request.fields['images_to_update'] = json.encode(imagesToUpdate); // ['0', '1']
      final response = await request.send();
      final data = json.decode(await response.stream.transform(utf8.decoder).first);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Product productResponse = Product.fromJson(data);
        return Success(productResponse);
      } else {
        // ERROR
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<bool>> addSNToProduct(String codEAN, List<String> serialNumbers) async {
    try {
      // Configura la URL para el endpoint del backend
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/producto/add-sn');

      // Configura los headers con el token de autorización
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token,
      };

      // Construye el cuerpo de la solicitud
      String body = json.encode({
        'codEAN': codEAN, // Código EAN del producto
        'series': serialNumbers, // Lista de números de serie
      });

      // Envía la solicitud POST al backend
      final response = await http.post(url, headers: headers, body: body);

      // Verifica la respuesta del servidor
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(true); // Devuelve éxito si la operación fue exitosa
      } else {
        // Maneja errores si el backend devuelve un estado diferente de 200 o 201
        final data = json.decode(response.body);
        return Error(listToString(data['message'] ?? 'Error desconocido'));
      }
    } catch (e) {
      print('Error al agregar números de serie: $e');
      return Error(e.toString()); // Devuelve un error en caso de excepción
    }
  }

  Future<Resource<bool>> delete(int id) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/producto/$id');
      Map<String, String> headers = {"Content-Type": "application/json", "Authorization": await token};
      final response = await http.delete(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(true);
      } else {
        // ERROR
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Object> updateStock(int productId, int newStock) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/producto/$productId/stock');

      final request = http.Request('PUT', url);
      request.headers['Authorization'] = await token;
      request.headers['Content-Type'] = 'application/json';
      request.body = json.encode({'stock': newStock});

      final response = await request.send();
      final responseData = await response.stream.bytesToString();

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Stock actualizado exitosamente: $responseData");
        return Success(true);
      } else {
        print("Error al actualizar el stock: $responseData");
        return Error("Error: $responseData");
      }
    } catch (e) {
      print('Error en la solicitud de actualización: $e');
      return Error(e.toString());
    }
  }

  Future<String> getToken() async {
    // Implementa tu lógica para obtener el token
    return "tu_token";
  }
}
