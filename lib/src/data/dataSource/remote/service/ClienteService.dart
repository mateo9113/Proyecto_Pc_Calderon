import 'dart:convert';
import 'package:app_proyecto_pccalderon/src/data/api/ApiConfig.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/ListToString.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';

import 'package:http/http.dart' as http;

class ClienteService {
  Future<String> token;

  ClienteService(this.token);

  // Crear Cliente
  Future<Resource<Cliente>> create(Cliente cliente) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/cliente');
      Map<String, String> headers = {"Content-Type": "application/json", "Authorization": await token};
      String body = json.encode(cliente.toJson());

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Cliente clienteResponse = Cliente.fromJson(data);
        return Success(clienteResponse);
      } else {
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  // Obtener Todos los Clientes
  Future<Resource<List<Cliente>>> getClientes() async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/cliente');
      Map<String, String> headers = {"Content-Type": "application/json", "Authorization": await token};
      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Cliente> clientes = Cliente.fromJsonList(data);
        return Success(clientes);
      } else {
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  // Obtener Cliente por ID
  Future<Resource<Cliente>> getClienteById(int id) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/cliente/$id');
      Map<String, String> headers = {"Content-Type": "application/json", "Authorization": await token};
      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Cliente cliente = Cliente.fromJson(data);
        return Success(cliente);
      } else {
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  // Actualizar Cliente
  Future<Resource<Cliente>> update(int id, Cliente cliente) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/cliente/$id');
      Map<String, String> headers = {"Content-Type": "application/json", "Authorization": await token};
      String body = json.encode(cliente.toJson());

      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Cliente clienteResponse = Cliente.fromJson(data);
        return Success(clienteResponse);
      } else {
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  // Eliminar Cliente
  Future<Resource<bool>> delete(int id) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROYECTO, '/cliente/$id');
      Map<String, String> headers = {"Content-Type": "application/json", "Authorization": await token};
      final response = await http.delete(url, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(true);
      } else {
        final data = json.decode(response.body);
        return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
