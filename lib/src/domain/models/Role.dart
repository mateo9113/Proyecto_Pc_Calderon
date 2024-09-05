class Role {
  String id;
  String nombre;
  String imagen;
  String ruta;
  DateTime creadoEn;
  DateTime modificadoEn;

  Role({
    required this.id,
    required this.nombre,
    required this.imagen,
    required this.ruta,
    required this.creadoEn,
    required this.modificadoEn,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        nombre: json["nombre"],
        imagen: json["imagen"],
        ruta: json["ruta"],
        creadoEn: DateTime.parse(json["creado_en"]),
        modificadoEn: DateTime.parse(json["modificado_en"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "imagen": imagen,
        "ruta": ruta,
        "creado_en": creadoEn.toIso8601String(),
        "modificado_en": modificadoEn.toIso8601String(),
      };
}
