import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ProductsRepository.dart';

class UpdateProductStockUseCase {
  final ProductsRepository repository;

  UpdateProductStockUseCase(this.repository);

  Future<Resource<bool>> run(int productId, int newStock) async {
    return await repository.updateProductStock(productId, newStock);
  }
}
