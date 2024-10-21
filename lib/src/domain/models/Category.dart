import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  int? id;
  String nombre;
  String descripcion;
  String? imagen;

  Category({
    this.id,
    required this.nombre,
    required this.descripcion,
    this.imagen,
  });

  static List<Category> fromJsonList(List<dynamic> jsonList) {
    List<Category> toList = [];
    for (var item in jsonList) {
      Category category = Category.fromJson(item);
      toList.add(category);
    }
    return toList;
  }

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "imagen": imagen,
      };
}
