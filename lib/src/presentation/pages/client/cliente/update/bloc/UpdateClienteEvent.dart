import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class ClienteUpdateEvent extends Equatable {
  const ClienteUpdateEvent();
  @override
  List<Object?> get props => [];
}

class ClienteUpdateInitEvent extends ClienteUpdateEvent {
  final Cliente? cliente;
  const ClienteUpdateInitEvent({required this.cliente});
  @override
  List<Object?> get props => [cliente];
}

class NameChanged extends ClienteUpdateEvent {
  final BlocFormItem nombre;
  const NameChanged({required this.nombre});
  @override
  List<Object?> get props => [nombre];
}

class TipoDocumentoChanged extends ClienteUpdateEvent {
  final BlocFormItem tipoDocumento;
  const TipoDocumentoChanged({required this.tipoDocumento});
  @override
  List<Object?> get props => [tipoDocumento];
}

class NumDocumentoChanged extends ClienteUpdateEvent {
  final BlocFormItem numDocumento;
  const NumDocumentoChanged({required this.numDocumento});
  @override
  List<Object?> get props => [numDocumento];
}

class TelefonoChanged extends ClienteUpdateEvent {
  final BlocFormItem telefono;
  const TelefonoChanged({required this.telefono});
  @override
  List<Object?> get props => [telefono];
}

class FormSubmit extends ClienteUpdateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends ClienteUpdateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}
