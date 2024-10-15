import 'dart:convert';
import 'dart:io';
import 'package:app_proyecto_pccalderon/src/data/api/ApiConfig.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/ListToString.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class UsersService {
  Future<String> token;

  UsersService(this.token);

  Future<Resource<Usuario>> update(int id, Usuario usuario) async {
    try {
      print('METODO ACTUALIZAR SIN IMAGEN');
      // http://192.168.80.13:3000/users/5
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/usuarios/$id');
      Map<String, String> headers = {"Content-Type": "application/json", "Authorization": await token};
      String body = json.encode({
        'nombre': usuario.nombre,
        'apellido': usuario.apellido,
        'phone': usuario.telefono,
      });
      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Usuario userResponse = Usuario.fromJson(data);
        return Success(userResponse);
      } else {
        // ERROR
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Usuario>> updateImage(int id, Usuario usuario, File file) async {
    try {
      print('METODO ACTUALIZAR CON IMAGEN');
      // http://192.168.80.13:3000/users/5
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/users/actualizarImagen/$id');
      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] = await token;
      request.files.add(http.MultipartFile('file', http.ByteStream(file.openRead().cast()), await file.length(),
          filename: basename(file.path), contentType: MediaType('image', 'jpg')));
      request.fields['user'] = json.encode({
        'name': usuario.nombre,
        'lastname': usuario.apellido,
        'phone': usuario.telefono,
      });
      final response = await request.send();
      print('RESPONSE: ${response.statusCode}');
      final data = json.decode(await response.stream.transform(utf8.decoder).first);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Usuario userResponse = Usuario.fromJson(data);
        return Success(userResponse);
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
