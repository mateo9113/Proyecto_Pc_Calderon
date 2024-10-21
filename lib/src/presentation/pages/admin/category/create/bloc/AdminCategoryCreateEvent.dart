import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class AdminCategoryCreateEvent extends Equatable {
  const AdminCategoryCreateEvent();
  @override
  List<Object?> get props => [];
}

class AdminCategoryCreateInitEvent extends AdminCategoryCreateEvent {
  const AdminCategoryCreateInitEvent();
  @override
  List<Object?> get props => [];
}

class NameChanged extends AdminCategoryCreateEvent {
  final BlocFormItem nombre;
  const NameChanged({required this.nombre});
  @override
  List<Object?> get props => [nombre];
}

class DescriptionChanged extends AdminCategoryCreateEvent {
  final BlocFormItem descripcion;
  const DescriptionChanged({required this.descripcion});
  @override
  List<Object?> get props => [descripcion];
}

class FormSubmit extends AdminCategoryCreateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminCategoryCreateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}

class PickImage extends AdminCategoryCreateEvent {
  const PickImage();
}

class TakePhoto extends AdminCategoryCreateEvent {
  const TakePhoto();
}
