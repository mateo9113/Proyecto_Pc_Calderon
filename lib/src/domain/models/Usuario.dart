import 'package:app_proyecto_pccalderon/src/domain/models/Role.dart';

class Usuario {
  int id;
  String nombre;
  String apellido;
  String correo;
  String telefono;
  dynamic imagen;
  dynamic notificacionToken;
  int estado;
  DateTime creadoEn;
  DateTime modificadoEn;
  int usuarioId;
  List<Role> roles;

  Usuario({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.correo,
    required this.telefono,
    this.imagen,
    this.notificacionToken,
    required this.estado,
    required this.creadoEn,
    required this.modificadoEn,
    required this.usuarioId,
    required this.roles,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        telefono: json["telefono"],
        imagen: json["imagen"],
        notificacionToken: json["notificacion_token"],
        estado: json["estado"],
        creadoEn: DateTime.parse(json["creado_en"]),
        modificadoEn: DateTime.parse(json["modificado_en"]),
        usuarioId: json["usuario_id"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "telefono": telefono,
        "imagen": imagen,
        "notificacion_token": notificacionToken,
        "estado": estado,
        "creado_en": creadoEn.toIso8601String(),
        "modificado_en": modificadoEn.toIso8601String(),
        "usuario_id": usuarioId,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
      };
}
