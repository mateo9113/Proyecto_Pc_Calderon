import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:equatable/equatable.dart';

class ClienteListState extends Equatable {
  final Resource? response;

  const ClienteListState({this.response});

  ClienteListState copyWith({Resource? response}) {
    return ClienteListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
