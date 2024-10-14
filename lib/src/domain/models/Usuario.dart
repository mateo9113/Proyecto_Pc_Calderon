import 'package:app_proyecto_pccalderon/src/domain/models/Role.dart';

class Usuario {
  int? id;
  String nombre;
  String apellido;
  String correo;
  String telefono;
  String? contrasenia;
  String? imagen;
  String? notificacionToken;
  List<Role>? roles;

  Usuario({
    this.id,
    required this.nombre,
    required this.apellido,
    required this.correo,
    required this.telefono,
    this.contrasenia,
    this.imagen,
    this.notificacionToken,
    this.roles,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"] ?? 0,
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        telefono: json["telefono"],
        contrasenia: json["contrasenia"] ?? '',
        imagen: json["imagen"] ?? '',
        notificacionToken: json["notificacion_token"] ?? '',
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "telefono": telefono,
        "imagen": imagen,
        "contrasenia": contrasenia,
        "notificacion_token": notificacionToken,
        "roles": roles != null ? List<dynamic>.from(roles!.map((x) => x.toJson())) : [],
      };
}
