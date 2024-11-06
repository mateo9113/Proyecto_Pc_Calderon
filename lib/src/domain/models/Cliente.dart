import 'dart:convert';

// Funciones de ayuda para convertir JSON a Cliente y viceversa
Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));
String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
  int? id;
  String nombre;
  String tipoDocumento;
  String numDocumento;
  String telefono;

  Cliente({
    this.id,
    required this.nombre,
    required this.tipoDocumento,
    required this.numDocumento,
    required this.telefono,
  });

  // Método para convertir una lista JSON a una lista de objetos Cliente
  static List<Cliente> fromJsonList(List<dynamic> jsonList) {
    List<Cliente> toList = [];
    for (var item in jsonList) {
      Cliente cliente = Cliente.fromJson(item);
      toList.add(cliente);
    }
    return toList;
  }

  // Método para crear una instancia de Cliente desde un JSON
  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        nombre: json["nombre"],
        tipoDocumento: json["tipo_documento"],
        numDocumento: json["num_documento"],
        telefono: json["telefono"],
      );

  // Método para convertir un objeto Cliente a JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "tipo_documento": tipoDocumento,
        "num_documento": numDocumento,
        "telefono": telefono,
      };
}
