import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';

class Venta {
  int? id; // ID opcional, generado automáticamente
  int idClient; // ID del cliente
  List<Product> products; // Lista de productos
  String total; // Total de la venta
  String subtotal; // Subtotal de la venta

  Venta({
    this.id,
    required this.idClient,
    required this.products,
    required this.total,
    required this.subtotal,
  });

  // Convertir de JSON a Venta
  factory Venta.fromJson(Map<String, dynamic> json) {
    return Venta(
      id: json['id'], // ID generado por el backend
      idClient: json['id_client'],
      products: (json['products'] as List<dynamic>).map((product) => Product.fromJson(product)).toList(),
      subtotal: json['subtotal'],
      total: json['total'],
    );
  }

  // Convertir de Venta a JSON
  Map<String, dynamic> toJson() {
    return {
      'id_client': idClient, // El backend necesita este campo
      'products': products
          .map((p) => {
                'id': p.id, // ID del producto
                'cantidad': p.quantity, // Cantidad del producto
              })
          .toList(),
      'subtotal': subtotal, // Subtotal como cadena
      'total': total, // Total como cadena
    };
  }

  // Convertir una lista de JSON a una lista de Ventas
  static List<Venta> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Venta.fromJson(json)).toList();
  }
}
