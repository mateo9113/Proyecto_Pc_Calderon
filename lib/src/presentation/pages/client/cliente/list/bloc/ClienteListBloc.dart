import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/ClientesUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/list/bloc/ClienteListEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/list/bloc/ClienteListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClienteListBloc extends Bloc<ClienteListEvent, ClienteListState> {
  final ClientesUseCases clientesUseCases;

  ClienteListBloc(this.clientesUseCases) : super(ClienteListState()) {
    on<LoadClientes>(_onLoadClientes);
    on<DeleteCliente>(_onDeleteCliente);
  }

  Future<void> _onLoadClientes(LoadClientes event, Emitter<ClienteListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await clientesUseCases.getClientes.run();
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteCliente(DeleteCliente event, Emitter<ClienteListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await clientesUseCases.delete.run(event.id);
    emit(state.copyWith(response: response));
  }
}
