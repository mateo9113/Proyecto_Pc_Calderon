import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/VentasUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/bloc/VentaListEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/bloc/VentaListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VentaListBloc extends Bloc<VentaListEvent, VentaListState> {
  final VentasUseCases ventasUseCases;

  VentaListBloc(this.ventasUseCases) : super(VentaListState()) {
    on<GetVentas>(_onGetVentas);
    on<DeleteVenta>(_onDeleteVenta);
    on<GetClientePorVenta>(_onGetClientePorVenta); // Evento para obtener cliente
  }

  // Obtener todas las ventas
  Future<void> _onGetVentas(GetVentas event, Emitter<VentaListState> emit) async {
    emit(state.copyWith(response: Loading())); // Cargando las ventas
    final response = await ventasUseCases.getVentas.run();
    emit(state.copyWith(response: response)); // Actualiza el estado con las ventas obtenidas
  }

  // Eliminar una venta
  Future<void> _onDeleteVenta(DeleteVenta event, Emitter<VentaListState> emit) async {
    emit(state.copyWith(response: Loading())); // Cargando el estado para eliminar
    final response = await ventasUseCases.deleteVenta.run(event.ventaId as int);
    emit(state.copyWith(response: response)); // Actualiza el estado con el resultado
  }

  // Obtener el cliente asociado a una venta
  Future<void> _onGetClientePorVenta(GetClientePorVenta event, Emitter<VentaListState> emit) async {
    try {
      if (event.idCliente == null) {
        // Handle the case where idCliente is null (e.g., show an error message)
        emit(state.copyWith(response: Error("ID de cliente no disponible")));
        return;
      }

      final response = await ventasUseCases.getClienteById.run(event.idCliente!);

      if (response is Success<Cliente>) {
        // Almacenar el cliente en el mapa por su idClient
        final updatedClientes = Map<int, Cliente>.from(state.clientes)..[event.idCliente!] = response.data;

        emit(state.copyWith(clientes: updatedClientes)); // Actualiza el estado con el nuevo cliente
      } else if (response is Error) {
        emit(state.copyWith(response: response)); // Si hay un error, lo pasamos al estado
      }
    } catch (e) {
      emit(state.copyWith(response: Error(e.toString()))); // Capturamos excepciones
    }
  }
}
