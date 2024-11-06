import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int? id;
  String nombre;
  String descripcion;
  String? imagen1;
  String? imagen2;
  int id_categoria;
  double precio;
  int stock;
  int? quantity;

  Product(
      {this.id,
      required this.nombre,
      required this.descripcion,
      this.imagen1,
      this.imagen2,
      required this.id_categoria,
      required this.precio,
      required this.stock,
      this.quantity});

  static List<Product> fromJsonList(List<dynamic> jsonList) {
    List<Product> toList = [];
    for (var item in jsonList) {
      Product product = Product.fromJson(item);
      toList.add(product);
    }
    return toList;
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        nombre: json["nombre"] ?? '',
        descripcion: json["descripcion"] ?? '',
        imagen1: json["imagen1"],
        imagen2: json["imagen2"],
        id_categoria: json["id_categoria"] is String ? int.parse(json["id_categoria"]) : json["id_categoria"],
        precio: json["precio"] is String
            ? double.parse(json["precio"])
            : json["precio"] is int
                ? (json["precio"] as int).toDouble()
                : json["precio"],
        stock: json["stock"] is String
            ? int.parse(json["stock"])
            : json["stock"] is int
                ? (json["stock"] as int).toInt()
                : json["stock"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "imagen1": imagen1,
        "imagen2": imagen2,
        "id_categoria": id_categoria,
        "precio": precio,
        "stock": stock,
        "quantity": quantity,
      };
}
