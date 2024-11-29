import 'package:app_proyecto_pccalderon/src/domain/models/VentaDetalle.dart';
// import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/bloc/VentaListBloc.dart';
// import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/bloc/VentaListEvent.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formatear la fecha
import 'package:open_file/open_file.dart'; // Para abrir el archivo PDF
import 'package:pdf/widgets.dart' as pw;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io'; // Para trabajar con archivos
import 'package:path_provider/path_provider.dart'; // Para obtener el directorio temporal

class VentaListItem extends StatelessWidget {
  // final VentaListBloc _bloc;

  final VentaDetalle venta;

  VentaListItem(/*this._bloc,*/ {required this.venta, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Usar el paquete intl para formatear la fecha
    String formattedDate = _formatDate(venta.fecha);

    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'client/venta/detail', arguments: venta);
      },
      child: ListTile(
        leading: Icon(Icons.shopping_cart),
        title: Text('Venta ID: ${venta.id}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Estado: ${venta.estado ?? "Desconocido"}'),
            // Mostrar solo la fecha formateada
            Text('Fecha: $formattedDate'),
            Text('Total: \$${venta.total}'),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.picture_as_pdf),
              onPressed: () async {
                await _generatePDF(venta, context); // Llamada a la función para generar PDF
              },
            ),
          ],
        ),
      ),
    );
  }

  // Función para formatear la fecha
  String _formatDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'Fecha no disponible';
    }

    try {
      // Si la fecha está en formato estándar (por ejemplo, "2024-11-28 15:30:00")
      DateTime parsedDate = DateTime.parse(date);
      // Formatear la fecha como "dd/MM/yyyy"
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (e) {
      return 'Fecha inválida';
    }
  }

  // Función para generar el PDF de la venta
  Future<void> _generatePDF(VentaDetalle venta, BuildContext context) async {
    try {
      // Crear un documento PDF
      final pdf = pw.Document();

      // Agregar una página al PDF
      pdf.addPage(pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Proforma de Venta', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              pw.Text('Venta ID: ${venta.id}', style: pw.TextStyle(fontSize: 18)),
              pw.Text('Fecha: ${_formatDate(venta.fecha)}', style: pw.TextStyle(fontSize: 18)),
              pw.Text('Estado: ${venta.estado ?? "Desconocido"}', style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              pw.Text('Productos:', style: pw.TextStyle(fontSize: 18)),
              pw.ListView.builder(
                itemCount: venta.products.length,
                itemBuilder: (pw.Context context, int index) {
                  final product = venta.products[index];
                  return pw.Text('${product.nombre} - Cantidad: ${product.quantity}',
                      style: pw.TextStyle(fontSize: 16));
                },
              ),
              pw.SizedBox(height: 20),
              pw.Text('Subtotal: \$${venta.subtotal}', style: pw.TextStyle(fontSize: 18)),
              pw.Text('Total: \$${venta.total}', style: pw.TextStyle(fontSize: 18)),
            ],
          );
        },
      ));

      // Obtener el directorio temporal para almacenar el PDF
      final output = await getTemporaryDirectory();
      final file = File("${output.path}/venta_${venta.id}.pdf");

      // Guardar el archivo PDF en el directorio
      await file.writeAsBytes(await pdf.save());

      // Mostrar un mensaje con el archivo generado
      Fluttertoast.showToast(msg: "PDF generado: ${file.path}", toastLength: Toast.LENGTH_LONG);

      // Abrir el PDF generado
      await _openPDF(file.path);
    } catch (e) {
      Fluttertoast.showToast(msg: "Error al generar PDF: $e", toastLength: Toast.LENGTH_LONG);
    }
  }

  // Función para abrir el PDF generado
  Future<void> _openPDF(String path) async {
    try {
      final result = await OpenFile.open(path);
      if (result.type != ResultType.done) {
        Fluttertoast.showToast(msg: "No se pudo abrir el PDF.");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error al abrir el PDF: $e", toastLength: Toast.LENGTH_LONG);
    }
  }
}
