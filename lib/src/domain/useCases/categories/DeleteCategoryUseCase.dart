import 'package:app_proyecto_pccalderon/src/domain/repository/CategoriesRepository.dart';

class DeleteCategoryUseCase {
  CategoriesRepository categoriesRepository;

  DeleteCategoryUseCase(this.categoriesRepository);

  run(int id) => categoriesRepository.delete(id);
}
