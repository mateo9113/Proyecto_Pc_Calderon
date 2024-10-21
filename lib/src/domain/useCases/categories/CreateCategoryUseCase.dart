import 'dart:io';

import 'package:app_proyecto_pccalderon/src/domain/models/Category.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/CategoriesRepository.dart';

class CreateCategoryUseCase {
  CategoriesRepository categoriesRepository;

  CreateCategoryUseCase(this.categoriesRepository);

  run(Category category, File file) => categoriesRepository.create(category, file);
}
