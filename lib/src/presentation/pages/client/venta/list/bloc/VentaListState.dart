import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:equatable/equatable.dart';

class VentaListState extends Equatable {
  final Resource? response;

  const VentaListState({this.response});

  VentaListState copyWith({Resource? response}) {
    return VentaListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
