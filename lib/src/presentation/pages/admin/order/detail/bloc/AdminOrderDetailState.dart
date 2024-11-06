import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:equatable/equatable.dart';

class AdminOrderDetailState extends Equatable {
  final Resource? response;

  const AdminOrderDetailState({this.response});

  AdminOrderDetailState copyWith({Resource? response}) {
    return AdminOrderDetailState(response: response ?? this.response);
  }

  @override
  List<Object?> get props => [response];
}
