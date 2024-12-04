import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/reportes/bloc/ReportesBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/reportes/bloc/ReportesEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/reportes/bloc/ReportesState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VentasPorFechaPage extends StatefulWidget {
  @override
  _VentasPorFechaPageState createState() => _VentasPorFechaPageState();
}

class _VentasPorFechaPageState extends State<VentasPorFechaPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final reportesBloc = BlocProvider.of<ReportesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ventas por Fecha'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Ingrese el rango de fechas (yyyy-mm-dd a yyyy-mm-dd)'),
          ),
          ElevatedButton(
            onPressed: () {
              final rango = _controller.text;
              reportesBloc.add(GetVentasPorFechaEvent(rango));
            },
            child: Text('Obtener Ventas por Fecha'),
          ),
          BlocBuilder<ReportesBloc, ReportesState>(
            builder: (context, state) {
              if (state is LoadingReportesState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SuccessReportesState) {
                return ListView.builder(
                  itemCount: state.ventas?.length ?? 0,
                  itemBuilder: (context, index) {
                    final venta = state.ventas?[index];
                    return ListTile(
                      title: Text('Venta ID: ${venta?.id}'),
                      subtitle: Text('Monto: ${venta?.total}'),
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
