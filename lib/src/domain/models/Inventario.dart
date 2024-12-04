class Inventario {
  final int id; // ID del producto
  final String nombre; // Nombre del producto
  final int cantidad; // Cantidad disponible en inventario
  final double precio; // Precio del producto
  final String categoria; // Categoría del producto
  final String descripcion; // Descripción del producto

  // Constructor
  Inventario({
    required this.id,
    required this.nombre,
    required this.cantidad,
    required this.precio,
    required this.categoria,
    required this.descripcion,
  });

  // Método para crear un objeto Inventario desde un JSON
  factory Inventario.fromJson(Map<String, dynamic> json) {
    return Inventario(
      id: json['id'],
      nombre: json['nombre'],
      cantidad: json['cantidad'],
      precio: json['precio'].toDouble(),
      categoria: json['categoria'],
      descripcion: json['descripcion'],
    );
  }

  // Método para convertir el objeto Inventario a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'cantidad': cantidad,
      'precio': precio,
      'categoria': categoria,
      'descripcion': descripcion,
    };
  }
}
