import 'dart:io';

import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/ProductsService.dart';
import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ProductsRepository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  ProductsService productsService;

  ProductsRepositoryImpl(this.productsService);

  @override
  Future<Resource<Product>> create(Product product, List<File> files) {
    return productsService.create(product, files);
  }

  @override
  Future<Resource<List<Product>>> getProductsByCategory(int idCategory) {
    return productsService.getProductsByCategory(idCategory);
  }

  @override
  Future<Resource<Product>> update(int id, Product product, List<File>? files, List<int>? imagesToUpdate) {
    if (files != null && imagesToUpdate != null) {
      return productsService.updateImage(id, product, files, imagesToUpdate);
    } else {
      return productsService.update(id, product);
    }
  }

  @override
  Future<Resource<bool>> delete(int id) {
    return productsService.delete(id);
  }
}
