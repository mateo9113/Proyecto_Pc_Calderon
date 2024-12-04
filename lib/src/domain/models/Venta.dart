import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';

class Venta {
  int? id; // ID opcional, generado automáticamente
  int idClient; // ID del cliente
  List<Product> products; // Lista de productos
  String total; // Total de la venta
  String subtotal; // Subtotal de la venta
  String? descuento;

  Venta({
    this.id,
    required this.idClient,
    required this.products,
    required this.total,
    required this.subtotal,
    this.descuento,
  });

  // Convertir de JSON a Venta
  factory Venta.fromJson(Map<String, dynamic> json) {
    return Venta(
      id: json['id'], // ID generado por el backend
      idClient: json['id_client'],
      products: (json['products'] as List<dynamic>).map((product) => Product.fromJson(product)).toList(),
      subtotal: json['subtotal'],
      total: json['total'],
      descuento: json['Descuento'],
    );
  }

  // Convertir de Venta a JSON
  Map<String, dynamic> toJson() {
    // Calcular el descuento como la diferencia entre el total y el subtotal
    double subtotalDouble = double.tryParse(subtotal) ?? 0.0;
    double totalDouble = double.tryParse(total) ?? 0.0;
    double descuentoCalculado = totalDouble < subtotalDouble ? subtotalDouble - totalDouble : 0.0;

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
      'Descuento': descuentoCalculado.toString() // Descuento calculado como la diferencia
    };
  }

  // Convertir una lista de JSON a una lista de Ventas
  static List<Venta> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Venta.fromJson(json)).toList();
  }
}
