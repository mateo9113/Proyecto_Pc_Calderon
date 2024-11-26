import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ProductsRepository.dart';

class AddSNToProductUseCase {
  final ProductsRepository repository;

  AddSNToProductUseCase(this.repository);

  Future<Resource<bool>> call(String codEAN, List<String> serialNumbers) {
    return repository.addSNToProduct(codEAN, serialNumbers);
  }
}
