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
}
