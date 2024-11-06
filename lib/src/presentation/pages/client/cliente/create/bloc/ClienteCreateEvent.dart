import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class ClienteCreateEvent extends Equatable {
  const ClienteCreateEvent();
  @override
  List<Object?> get props => [];
}

class ClienteCreateInitEvent extends ClienteCreateEvent {
  const ClienteCreateInitEvent();
  @override
  List<Object?> get props => [];
}

class NameChanged extends ClienteCreateEvent {
  final BlocFormItem nombre;
  const NameChanged({required this.nombre});
  @override
  List<Object?> get props => [nombre];
}

class TipoDocumentoChanged extends ClienteCreateEvent {
  final BlocFormItem tipoDocumento;
  const TipoDocumentoChanged({required this.tipoDocumento});
  @override
  List<Object?> get props => [tipoDocumento];
}

class NumDocumentoChanged extends ClienteCreateEvent {
  final BlocFormItem numDocumento;
  const NumDocumentoChanged({required this.numDocumento});
  @override
  List<Object?> get props => [numDocumento];
}

class TelefonoChanged extends ClienteCreateEvent {
  final BlocFormItem telefono;
  const TelefonoChanged({required this.telefono});
  @override
  List<Object?> get props => [telefono];
}

class FormSubmit extends ClienteCreateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends ClienteCreateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}
