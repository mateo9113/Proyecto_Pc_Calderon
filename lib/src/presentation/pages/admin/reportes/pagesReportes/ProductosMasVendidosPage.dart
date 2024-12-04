import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/reportes/bloc/ReportesBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/reportes/bloc/ReportesEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/reportes/bloc/ReportesState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductosMasVendidosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtén el bloc de Reportes
    final reportesBloc = BlocProvider.of<ReportesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos Más Vendidos'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Disparar el evento para cargar productos más vendidos
              reportesBloc.add(GetProductosMasVendidosEvent());
            },
            child: Text('Obtener Productos Más Vendidos'),
          ),
          BlocBuilder<ReportesBloc, ReportesState>(
            builder: (context, state) {
              if (state is LoadingReportesState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SuccessReportesState) {
                return ListView.builder(
                  itemCount: state.productos?.length ?? 0,
                  itemBuilder: (context, index) {
                    final product = state.productos?[index];
                    return ListTile(
                      title: Text(product?.nombre ?? 'Producto desconocido'),
                      subtitle: Text('Cantidad vendida: ${product?.quantity}'),
                    );
                  },
                );
              } else if (state is ErrorReportesState) {
                return Center(child: Text('Error: ${state.errorMessage}'));
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
