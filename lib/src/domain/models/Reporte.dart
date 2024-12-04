class Reporte {
  final String tipo;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final List<Map<String, dynamic>> datos;

  Reporte({
    required this.tipo,
    required this.fechaInicio,
    required this.fechaFin,
    required this.datos,
  });

  factory Reporte.fromJson(Map<String, dynamic> json) {
    return Reporte(
      tipo: json['tipo'],
      fechaInicio: DateTime.parse(json['fechaInicio']),
      fechaFin: DateTime.parse(json['fechaFin']),
      datos: List<Map<String, dynamic>>.from(json['datos']),
    );
  }
}
