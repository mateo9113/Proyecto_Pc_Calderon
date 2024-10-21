import 'dart:io';

import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Category.dart';

abstract class CategoriesRepository {
  Future<Resource<Category>> create(Category category, File file);
  Future<Resource<Category>> update(int id, Category category, File? file);
  Future<Resource<List<Category>>> getCategories();
  Future<Resource<bool>> delete(int id);
}
