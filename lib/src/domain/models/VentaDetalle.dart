import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';

class VentaDetalle {
  int? id; // ID opcional, generado automáticamente
  int idClient; // ID del cliente
  List<Product> products; // Lista de productos
  String total; // Total de la venta
  String subtotal; // Subtotal de la venta
  String? estado; // Estado de la venta (Ejemplo: "PAGADO")
  String? fecha; // Fecha de la venta
  int? cantidad;

  VentaDetalle({
    this.id,
    required this.idClient,
    required this.products,
    required this.total,
    required this.subtotal,
    this.estado,
    this.fecha,
    this.cantidad,
  });

  // Convertir de JSON a Venta
  factory VentaDetalle.fromJson(Map<String, dynamic> json) {
    return VentaDetalle(
      id: json['id'], // ID generado por el backend
      idClient: json['id_cliente'],
      products: (json['ventas_detalle'] as List<dynamic>)
          .map((productDetail) => Product.fromJson(productDetail['product']))
          .toList(),
      subtotal: json['subTotal'], // Cambié 'subtotal' para que coincida con el JSON
      total: json['Total'], // Cambié 'total' para que coincida con el JSON
      estado: json['estado'],
      fecha: json['fecha'],
    );
  }

  // Función para extraer solo la información relevante para mostrar
  Map<String, dynamic> toSimplifiedJson() {
    return {
      'id': id,
      'total': total,
      'idClient': idClient,
      'estado': estado, // Agregado estado aquí
      'fecha': fecha, // Agregado fecha aquí
      'cantidad': cantidad,
      'productos': products
          .map((product) => {
                'nombre': product.nombre, // Nombre del producto
              })
          .toList(),
    };
  }

  // Convertir una lista de JSON a una lista de Ventas
  static List<VentaDetalle> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => VentaDetalle.fromJson(json)).toList();
  }
}
