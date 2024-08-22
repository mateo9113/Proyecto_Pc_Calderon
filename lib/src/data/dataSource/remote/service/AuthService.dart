import 'dart:convert';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:app_proyecto_pccalderon/src/data/api/ApiConfig.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/AuthResponse.dart';

class AuthService {
  Future<Resource> login(String correo, String contrasenia) async {
    try {
      // http://192.168.45.231:3000/auth/login
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/auth/login');
      Map<String, String> headers = {"Content-Type": "application/json"};
      String body = json.encode({'correo': correo, 'contrasenia': contrasenia});

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        return Success(authResponse);
      } else {
        //Error

        return Error(data['message']);
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
