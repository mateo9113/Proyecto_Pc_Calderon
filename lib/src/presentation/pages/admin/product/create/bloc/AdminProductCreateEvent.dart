import 'package:app_proyecto_pccalderon/src/domain/models/Category.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';

import 'package:equatable/equatable.dart';

abstract class AdminProductCreateEvent extends Equatable {
  const AdminProductCreateEvent();
  @override
  List<Object?> get props => [];
}

class AdminProductCreateInitEvent extends AdminProductCreateEvent {
  final Category? category;
  const AdminProductCreateInitEvent({required this.category});
  @override
  List<Object?> get props => [category];
}

class NameChanged extends AdminProductCreateEvent {
  final BlocFormItem nombre;
  const NameChanged({required this.nombre});
  @override
  List<Object?> get props => [nombre];
}

class DescriptionChanged extends AdminProductCreateEvent {
  final BlocFormItem descripcion;
  const DescriptionChanged({required this.descripcion});
  @override
  List<Object?> get props => [descripcion];
}

class PriceChanged extends AdminProductCreateEvent {
  final BlocFormItem precio;
  const PriceChanged({required this.precio});
  @override
  List<Object?> get props => [precio];
}

class CantidadChanged extends AdminProductCreateEvent {
  final BlocFormItem stock;
  const CantidadChanged({required this.stock});
  @override
  List<Object?> get props => [stock];
}

class FormSubmit extends AdminProductCreateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminProductCreateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}

class PickImage extends AdminProductCreateEvent {
  final int numberFile;
  const PickImage({required this.numberFile});
}

class TakePhoto extends AdminProductCreateEvent {
  final int numberFile;
  const TakePhoto({required this.numberFile});
}
