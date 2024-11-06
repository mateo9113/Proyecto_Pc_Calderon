import 'dart:io';

import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/create/bloc/AdminProductCreateEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/create/bloc/AdminProductCreateState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminProductCreateBloc extends Bloc<AdminProductCreateEvent, AdminProductCreateState> {
  ProductsUseCases productsUseCases;

  AdminProductCreateBloc(this.productsUseCases) : super(AdminProductCreateState()) {
    on<AdminProductCreateInitEvent>(_onInitEvent);
    on<NameChanged>(_onNameChanged);
    on<PriceChanged>(_onPriceChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<CantidadChanged>(_onCantidadChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(AdminProductCreateInitEvent event, Emitter<AdminProductCreateState> emit) async {
    emit(state.copyWith(idCategory: event.category?.id, formKey: formKey));
  }

  Future<void> _onNameChanged(NameChanged event, Emitter<AdminProductCreateState> emit) async {
    emit(state.copyWith(
        nombre:
            BlocFormItem(value: event.nombre.value, error: event.nombre.value.isNotEmpty ? null : 'Ingresa el nombre'),
        formKey: formKey));
  }

  Future<void> _onPriceChanged(PriceChanged event, Emitter<AdminProductCreateState> emit) async {
    emit(state.copyWith(
        precio:
            BlocFormItem(value: event.precio.value, error: event.precio.value.isNotEmpty ? null : 'Ingresa el precio'),
        formKey: formKey));
  }

  Future<void> _onDescriptionChanged(DescriptionChanged event, Emitter<AdminProductCreateState> emit) async {
    emit(state.copyWith(
        descripcion: BlocFormItem(
            value: event.descripcion.value,
            error: event.descripcion.value.isNotEmpty ? null : 'Ingresa la descripcion'),
        formKey: formKey));
  }

  Future<void> _onCantidadChanged(CantidadChanged event, Emitter<AdminProductCreateState> emit) async {
    emit(state.copyWith(
        stock:
            BlocFormItem(value: event.stock.value, error: event.stock.value.isNotEmpty ? null : 'Ingresa la cantidad'),
        formKey: formKey));
  }

  Future<void> _onPickImage(PickImage event, Emitter<AdminProductCreateState> emit) async {
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

  Future<void> _onTakePhoto(TakePhoto event, Emitter<AdminProductCreateState> emit) async {
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

  Future<void> _onFormSubmit(FormSubmit event, Emitter<AdminProductCreateState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    if (state.file1 != null && state.file2 != null) {
      List<File> files = [state.file1!, state.file2!];
      Resource response = await productsUseCases.create.run(state.toProduct(), files);
      emit(state.copyWith(response: response, formKey: formKey));
    } else {
      emit(state.copyWith(
        response: Error('Selecciona las dos imagenes'),
        formKey: formKey,
      ));
    }
  }

  Future<void> _onResetForm(ResetForm event, Emitter<AdminProductCreateState> emit) async {
    emit(state.resetForm());
    // state.formKey?.currentState?.reset();
  }
}
