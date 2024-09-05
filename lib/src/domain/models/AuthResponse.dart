// To parse this JSON data, do
//
//     final authResponde = authRespondeFromJson(jsonString);

import 'dart:convert';
import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';

AuthResponse authRespondeFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authRespondeToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  Usuario usuario;
  String token;

  AuthResponse({
    required this.usuario,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario.toJson(),
        "token": token,
      };
}
