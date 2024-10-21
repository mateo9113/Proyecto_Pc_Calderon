import 'package:app_proyecto_pccalderon/src/domain/repository/CategoriesRepository.dart';

class GetCategoriesUseCase {
  CategoriesRepository categoriesRepository;

  GetCategoriesUseCase(this.categoriesRepository);

  run() => categoriesRepository.getCategories();
}
