// ignore: file_names
import 'package:app_proyecto_pccalderon/src/domain/repository/ShoppingBagRepository.dart';

class GetProductsShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  GetProductsShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.getProducts();
}
