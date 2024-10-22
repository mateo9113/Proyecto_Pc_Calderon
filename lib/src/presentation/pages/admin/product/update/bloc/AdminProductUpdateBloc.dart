import 'dart:io';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminProductUpdateBloc extends Bloc<AdminProductUpdateEvent, AdminProductUpdateState> {
  ProductsUseCases productsUseCases;

  AdminProductUpdateBloc(this.productsUseCases) : super(AdminProductUpdateState()) {
    on<AdminProductUpdateInitEvent>(_onInitEvent);
    on<NameChanged>(_onNameChanged);
    on<PriceChanged>(_onPriceChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
  }

  final formKey = GlobalKey<FormState>();
  final List<int> imagesToUpdate = <int>[];

  Future<void> _onInitEvent(AdminProductUpdateInitEvent event, Emitter<AdminProductUpdateState> emit) async {
    emit(state.copyWith(
        id: event.product?.id,
        idCategoria: event.product?.id_categoria,
        nombre: BlocFormItem(value: event.product?.nombre ?? ''),
        descripcion: BlocFormItem(value: event.product?.descripcion ?? ''),
        precio: BlocFormItem(value: event.product?.precio.toString() ?? ''),
        formKey: formKey));
  }

  Future<void> _onNameChanged(NameChanged event, Emitter<AdminProductUpdateState> emit) async {
    emit(state.copyWith(
        nombre:
            BlocFormItem(value: event.nombre.value, error: event.nombre.value.isNotEmpty ? null : 'Ingresa el nombre'),
        formKey: formKey));
  }

  Future<void> _onPriceChanged(PriceChanged event, Emitter<AdminProductUpdateState> emit) async {
    emit(state.copyWith(
        precio:
            BlocFormItem(value: event.precio.value, error: event.precio.value.isNotEmpty ? null : 'Ingresa el precio'),
        formKey: formKey));
  }

  Future<void> _onDescriptionChanged(DescriptionChanged event, Emitter<AdminProductUpdateState> emit) async {
    emit(state.copyWith(
        descripcion: BlocFormItem(
            value: event.descripcion.value,
            error: event.descripcion.value.isNotEmpty ? null : 'Ingresa la descripcion'),
        formKey: formKey));
  }

  Future<void> _onPickImage(PickImage event, Emitter<AdminProductUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (event.numberFile == 1) {
        emit(state.copyWith(file1: File(image.path), formKey: formKey));
      } else if (event.numberFile == 2) {
        emit(state.copyWith(file2: File(image.path), formKey: formKey));
      }
    }
  }

  Future<void> _onTakePhoto(TakePhoto event, Emitter<AdminProductUpdateState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      if (event.numberFile == 1) {
        emit(state.copyWith(file1: File(image.path), formKey: formKey));
      } else if (event.numberFile == 2) {
        emit(state.copyWith(file2: File(image.path), formKey: formKey));
      }
    }
  }

  Future<void> _onFormSubmit(FormSubmit event, Emitter<AdminProductUpdateState> emit) async {
    imagesToUpdate.clear();
    emit(state.copyWith(response: Loading(), formKey: formKey));
    List<File>? files = [];
    if (state.file1 != null) {
      imagesToUpdate.add(0);
      files.add(state.file1!);
    }
    if (state.file2 != null) {
      imagesToUpdate.add(1);
      files.add(state.file2!);
    }
    Resource response = await productsUseCases.update.run(state.id, state.toProduct(), files.isNotEmpty ? files : null,
        imagesToUpdate.isNotEmpty ? imagesToUpdate : null);
    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onResetForm(ResetForm event, Emitter<AdminProductUpdateState> emit) async {
    emit(state.resetForm());
    // state.formKey?.currentState?.reset();
  }
}
