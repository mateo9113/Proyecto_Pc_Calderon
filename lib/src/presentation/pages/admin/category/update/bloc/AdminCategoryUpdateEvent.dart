import 'package:app_proyecto_pccalderon/src/domain/models/Category.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class AdminCategoryUpdateEvent extends Equatable {
  const AdminCategoryUpdateEvent();
  @override
  List<Object?> get props => [];
}

class AdminCategoryUpdateInitEvent extends AdminCategoryUpdateEvent {
  final Category? category;
  const AdminCategoryUpdateInitEvent({required this.category});
  @override
  List<Object?> get props => [category];
}

class NameChanged extends AdminCategoryUpdateEvent {
  final BlocFormItem nombre;
  const NameChanged({required this.nombre});
  @override
  List<Object?> get props => [nombre];
}

class DescriptionChanged extends AdminCategoryUpdateEvent {
  final BlocFormItem descripcion;
  const DescriptionChanged({required this.descripcion});
  @override
  List<Object?> get props => [descripcion];
}

class FormSubmit extends AdminCategoryUpdateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class PickImage extends AdminCategoryUpdateEvent {
  const PickImage();
}

class TakePhoto extends AdminCategoryUpdateEvent {
  const TakePhoto();
}

class ResetForm extends AdminCategoryUpdateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}
