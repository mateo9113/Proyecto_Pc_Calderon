import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/add_sn/bloc/AdminProductAddSNEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/add_sn/bloc/AdminProductAddSNState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminProductAddSNBloc extends Bloc<AdminProductAddSNEvent, AdminProductAddSNState> {
  AdminProductAddSNBloc() : super(AdminProductAddSNState.initial());

  @override
  Stream<AdminProductAddSNState> mapEventToState(AdminProductAddSNEvent event) async* {
    if (event is LoadProductEvent) {
      yield state.copyWith(codEAN: event.codEAN, loading: true);
      // Aquí puedes hacer llamadas al repositorio si es necesario.
      yield state.copyWith(loading: false);
    } else if (event is SNChangedEvent) {
      final updatedSNList = List<String>.from(state.series)..[event.index] = event.sn;
      yield state.copyWith(series: updatedSNList);
    } else if (event is AddSNEvent) {
      yield state.copyWith(loading: true);
      // Aquí interactúas con tu repositorio para enviar los datos al backend
      yield state.copyWith(loading: false, success: true);
    }
  }
}
