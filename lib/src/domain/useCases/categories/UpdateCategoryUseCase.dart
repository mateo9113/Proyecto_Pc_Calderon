import 'dart:io';
import 'package:app_proyecto_pccalderon/src/domain/models/Category.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/CategoriesRepository.dart';

class UpdateCategoryUseCase {
  CategoriesRepository categoriesRepository;

  UpdateCategoryUseCase(this.categoriesRepository);

  run(int id, Category category, File? file) => categoriesRepository.update(id, category, file);
}
