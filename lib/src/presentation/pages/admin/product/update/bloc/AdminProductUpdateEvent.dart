import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class AdminProductUpdateEvent extends Equatable {
  const AdminProductUpdateEvent();
  @override
  List<Object?> get props => [];
}

class AdminProductUpdateInitEvent extends AdminProductUpdateEvent {
  final Product? product;
  const AdminProductUpdateInitEvent({required this.product});
  @override
  List<Object?> get props => [product];
}

class NameChanged extends AdminProductUpdateEvent {
  final BlocFormItem nombre;
  const NameChanged({required this.nombre});
  @override
  List<Object?> get props => [nombre];
}

class DescriptionChanged extends AdminProductUpdateEvent {
  final BlocFormItem descripcion;
  const DescriptionChanged({required this.descripcion});
  @override
  List<Object?> get props => [descripcion];
}

class CantidadChanged extends AdminProductUpdateEvent {
  final BlocFormItem stock;
  const CantidadChanged({required this.stock});
  @override
  List<Object?> get props => [stock];
}

class PriceChanged extends AdminProductUpdateEvent {
  final BlocFormItem precio;
  const PriceChanged({required this.precio});
  @override
  List<Object?> get props => [precio];
}

class FormSubmit extends AdminProductUpdateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminProductUpdateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}

class PickImage extends AdminProductUpdateEvent {
  final int numberFile;
  const PickImage({required this.numberFile});
}

class TakePhoto extends AdminProductUpdateEvent {
  final int numberFile;
  const TakePhoto({required this.numberFile});
}
