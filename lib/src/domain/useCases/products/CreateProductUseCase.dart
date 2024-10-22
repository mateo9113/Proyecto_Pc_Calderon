import 'dart:io';
import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ProductsRepository.dart';

class CreateProductUseCase {
  ProductsRepository productsRepository;

  CreateProductUseCase(this.productsRepository);

  run(Product product, List<File> files) => productsRepository.create(product, files);
}
