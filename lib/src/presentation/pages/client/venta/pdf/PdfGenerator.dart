import 'dart:io';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/VentaDetalle.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class PDFGenerator {
  static Future<void> generatePDF(VentaDetalle venta, Cliente? cliente) async {
    try {
      final pdf = pw.Document();
      final formattedDate = _formatDate(venta.fecha);

      // Agregamos la página al PDF
      pdf.addPage(pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Empresa XYZ S.A.', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
                  pw.Text('Proforma de Venta', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Text('Dirección: Calle Ficticia 123, Ciudad, País', style: pw.TextStyle(fontSize: 14)),
              pw.Text('Teléfono: +123 456 789', style: pw.TextStyle(fontSize: 14)),
              pw.Text('Email: contacto@empresa.com', style: pw.TextStyle(fontSize: 14)),
              pw.SizedBox(height: 20),

              // Detalle de la venta (ID, Fecha)
              pw.Text('Venta ID: ${venta.id}', style: pw.TextStyle(fontSize: 18)),
              pw.Text('Fecha: $formattedDate', style: pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 10),

              // Información del cliente
              pw.Text('Cliente: ${cliente?.nombre ?? "Cargando..."}', style: pw.TextStyle(fontSize: 18)),
              pw.Text('Teléfono: ${cliente?.telefono ?? "Cargando..."}', style: pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 20),

              // Detalle de los productos (tabla)
              pw.Text('Productos:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Table.fromTextArray(
                context: context,
                headers: ['Producto', 'Cantidad', 'Precio Unitario', 'Subtotal'],
                data: venta.products.map((product) {
                  final quantity = product.quantity ?? 0;
                  final precio = product.precio;
                  final subtotal = (precio * quantity).toStringAsFixed(2);

                  return [
                    product.nombre,
                    quantity.toString(),
                    '\$${precio.toStringAsFixed(2)}',
                    '\$${subtotal}',
                  ];
                }).toList(),
              ),
              pw.SizedBox(height: 20),

              // Totales
              pw.Text('Total: \$${venta.total}', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 30),

              // Firma o observaciones
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text('Firma: ______________________', style: pw.TextStyle(fontSize: 14)),
                ],
              ),
            ],
          );
        },
      ));

      // Guardar el PDF en el directorio temporal
      final output = await getTemporaryDirectory();
      final file = File("${output.path}/proforma_venta_${venta.id}.pdf");
      await file.writeAsBytes(await pdf.save());

      Fluttertoast.showToast(msg: "PDF generado: ${file.path}", toastLength: Toast.LENGTH_LONG);
      await _openPDF(file.path);
    } catch (e) {
      Fluttertoast.showToast(msg: "Error al generar PDF: $e", toastLength: Toast.LENGTH_LONG);
    }
  }

  static String _formatDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'Fecha no disponible';
    }

    try {
      DateTime parsedDate = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (e) {
      return 'Fecha inválida';
    }
  }

  // Función para abrir el PDF generado
  static Future<void> _openPDF(String path) async {
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
