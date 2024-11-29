import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/VentasUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/bloc/VentaListEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/bloc/VentaListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VentaListBloc extends Bloc<VentaListEvent, VentaListState> {
  final VentasUseCases ventasUseCases;

  VentaListBloc(this.ventasUseCases) : super(VentaListState()) {
    on<GetVentas>(_onGetVentas);
    on<DeleteVenta>(_onDeleteVenta);
  }

  Future<void> _onGetVentas(GetVentas event, Emitter<VentaListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await ventasUseCases.getVentas.run();
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteVenta(DeleteVenta event, Emitter<VentaListState> emit) async {
    {
      emit(state.copyWith(response: Loading()));
      Resource response = await ventasUseCases.deleteVenta.run(event.ventaId as int);
      emit(state.copyWith(response: response));
    }
  }
}
