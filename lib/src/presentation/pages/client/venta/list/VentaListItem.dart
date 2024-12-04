import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/VentaDetalle.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/bloc/VentaListEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/pdf/PdfGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/bloc/VentaListBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/bloc/VentaListState.dart';

class VentaListItem extends StatelessWidget {
  final VentaDetalle venta;

  VentaListItem({required this.venta, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = _formatDate(venta.fecha);

    return BlocBuilder<VentaListBloc, VentaListState>(
      builder: (context, state) {
        Cliente? cliente = state.clientes[venta.idClient];

        // Si el cliente no está en el estado, disparar evento para obtenerlo
        if (cliente == null) {
          BlocProvider.of<VentaListBloc>(context).add(GetClientePorVenta(venta.idClient));
        }

        return ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text('Venta ID: ${venta.id}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Estado: ${venta.estado ?? "Desconocido"}'),
              Text('Fecha: $formattedDate'),
              Text('Total: \$${venta.total}'),
              if (cliente != null) Text('Cliente: ${cliente.nombre}'),
              if (cliente == null) Text('Cliente: Cargando...'),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.picture_as_pdf),
                onPressed: () async {
                  await PDFGenerator.generatePDF(venta, cliente);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Función para formatear la fecha
  String _formatDate(String? date) {
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
}
