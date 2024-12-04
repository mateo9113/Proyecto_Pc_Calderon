import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/reportes/pagesReportes/ProductosMasVendidosPage.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/reportes/pagesReportes/VentasPorClientePage.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/reportes/pagesReportes/VentasPorFechaPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reportes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Botón para los productos más vendidos
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductosMasVendidosPage(),
                  ),
                );
              },
              child: Text('Productos Más Vendidos'),
            ),
            // Botón para las ventas por cliente
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VentasPorClientePage(),
                  ),
                );
              },
              child: Text('Ventas por Cliente'),
            ),
            // Botón para las ventas por fecha
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VentasPorFechaPage(),
                  ),
                );
              },
              child: Text('Ventas por Fecha'),
            ),
          ],
        ),
      ),
    );
  }
}
