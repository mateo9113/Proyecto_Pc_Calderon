import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/category/list/bloc/AdminCategoryListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCategoryListBloc extends Bloc<AdminCategoryListEvent, AdminCategoryListState> {
  CategoriesUseCases categoriesUseCases;

  AdminCategoryListBloc(this.categoriesUseCases) : super(AdminCategoryListState()) {
    on<GetCategories>(_onGetCategories);
    on<DeleteCategory>(_onDeleteCategory);
  }

  Future<void> _onGetCategories(GetCategories event, Emitter<AdminCategoryListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await categoriesUseCases.getCategories.run();
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteCategory(DeleteCategory event, Emitter<AdminCategoryListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await categoriesUseCases.delete.run(event.id);
    emit(state.copyWith(response: response));
  }
}
