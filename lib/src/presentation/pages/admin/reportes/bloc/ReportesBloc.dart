import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/ReportesUseCaases.dart';

import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/reportes/bloc/ReportesEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/reportes/bloc/ReportesState.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ReportesBloc extends Bloc<ReportesEvent, ReportesState> {
  final ReportesUseCases reportesUseCases;

  ReportesBloc(this.reportesUseCases) : super(LoadingReportesState());

  @override
  Stream<ReportesState> mapEventToState(ReportesEvent event) async* {
    if (event is GetReporteClientesEvent) {
      yield* _mapGetReporteClientesToState();
    } else if (event is GetReporteProductosEvent) {
      yield* _mapGetReporteProductosToState();
    } else if (event is GetReporteVentasEvent) {
      yield* _mapGetReporteVentasToState();
    } else if (event is GetReporteInventarioEvent) {
      yield* _mapGetReporteInventarioToState();
    } else if (event is GetProductosMasVendidosEvent) {
      yield* _mapGetProductosMasVendidosToState();
    } else if (event is GetVentasPorClienteEvent) {
      yield* _mapGetVentasPorClienteToState(event.idCliente);
    } else if (event is GetVentasPorFechaEvent) {
      yield* _mapGetVentasPorFechaToState(event.rango);
    } else if (event is GetProformaEvent) {
      yield* _mapGetProformaToState(event.id);
    }
  }

  // Métodos para manejar cada evento

  Stream<ReportesState> _mapGetReporteClientesToState() async* {
    yield LoadingReportesState();
    final response = await reportesUseCases.getReporteClientes.run();
    yield response.when(
      success: (data) => SuccessReportesState(message: 'Reporte de clientes cargado', productos: data),
      error: (error) => ErrorReportesState(error),
    );
  }

  Stream<ReportesState> _mapGetReporteProductosToState() async* {
    yield LoadingReportesState();
    final response = await reportesUseCases.getReporteProductos.run();
    yield response.when(
      success: (data) => SuccessReportesState(productos: data),
      error: (error) => ErrorReportesState(error),
    );
  }

  Stream<ReportesState> _mapGetReporteVentasToState() async* {
    yield LoadingReportesState();
    final response = await reportesUseCases.getReporteVentas.run();
    yield response.when(
      success: (data) => SuccessReportesState(ventas: data),
      error: (error) => ErrorReportesState(error),
    );
  }

  Stream<ReportesState> _mapGetReporteInventarioToState() async* {
    yield LoadingReportesState();
    final response = await reportesUseCases.getReporteInventario.run();
    yield response.when(
      success: (data) => SuccessReportesState(message: 'Inventario cargado', productos: data),
      error: (error) => ErrorReportesState(error),
    );
  }

  Stream<ReportesState> _mapGetProductosMasVendidosToState() async* {
    yield LoadingReportesState();
    final response = await reportesUseCases.getProductosMasVendidos.run();
    yield response.when(
      success: (data) => SuccessReportesState(productos: data),
      error: (error) => ErrorReportesState(error),
    );
  }

  Stream<ReportesState> _mapGetVentasPorClienteToState(int idCliente) async* {
    yield LoadingReportesState();
    final response = await reportesUseCases.getVentasPorCliente.run(idCliente);
    yield response.when(
      success: (data) => SuccessReportesState(ventas: data),
      error: (error) => ErrorReportesState(error),
    );
  }

  Stream<ReportesState> _mapGetVentasPorFechaToState(String rango) async* {
    yield LoadingReportesState();
    final response = await reportesUseCases.getVentasPorFecha.run(rango);
    yield response.when(
      success: (data) => SuccessReportesState(ventas: data),
      error: (error) => ErrorReportesState(error),
    );
  }

  Stream<ReportesState> _mapGetProformaToState(int id) async* {
    yield LoadingReportesState();
    final response = await reportesUseCases.getProforma.run(id);
    yield response.when(
      success: (data) => SuccessReportesState(message: 'Proforma cargada', ventas: data),
      error: (error) => ErrorReportesState(error),
    );
  }
}
