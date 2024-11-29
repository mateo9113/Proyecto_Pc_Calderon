import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/VentaDetalle.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';

class PdfGenerator {
  static Future<void> generateAndShowPdf(VentaDetalle venta, Cliente cliente) async {
    try {
      // Crear documento PDF
      final pdf = pw.Document();

      // Agregar contenido al PDF
      pdf.addPage(pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Proforma de Venta', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              pw.Text('Venta ID: ${venta.id}', style: pw.TextStyle(fontSize: 18)),
              pw.Text('Cliente: ${cliente.nombre}', style: pw.TextStyle(fontSize: 18)), // Cliente
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

      // Obtener la ruta del almacenamiento temporal
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/proforma_${venta.id}.pdf';

      // Guardar el PDF en la ruta especificada
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      // Mostrar un mensaje indicando que el PDF se generó
      Fluttertoast.showToast(msg: 'PDF generado correctamente', toastLength: Toast.LENGTH_LONG);

      // Abrir el archivo PDF
      _openPdf(filePath);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error al generar el PDF: $e');
    }
  }

  // Función para abrir el PDF generado
  static Future<void> _openPdf(String filePath) async {
    final result = await OpenFile.open(filePath);

    if (result.type != ResultType.done) {
      Fluttertoast.showToast(msg: 'No se pudo abrir el PDF');
    }
  }
}
