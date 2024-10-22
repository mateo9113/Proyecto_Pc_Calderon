import 'dart:io';

import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';

abstract class ProductsRepository {
  Future<Resource<Product>> create(Product product, List<File> files);
  Future<Resource<List<Product>>> getProductsByCategory(int idCategory);
  Future<Resource<Product>> update(int id, Product product, List<File>? files, List<int>? imagesToUpdate);
  Future<Resource<bool>> delete(int id);
}
