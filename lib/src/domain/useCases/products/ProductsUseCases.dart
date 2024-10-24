import 'package:app_proyecto_pccalderon/src/domain/useCases/products/CreateProductUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/DeleteProductUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/GetProductsByCategoryUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/UpdateProductUseCase.dart';

class ProductsUseCases {
  CreateProductUseCase create;
  GetProductsByCategoryUseCase getProductsByCategory;
  UpdateProductUseCase update;
  DeleteProductUseCase delete;

  ProductsUseCases({
    required this.create,
    required this.getProductsByCategory,
    required this.update,
    required this.delete,
  });
}
