import 'package:app_proyecto_pccalderon/src/domain/repository/ShoppingBagRepository.dart';
// import 'package:ecommerce_flutter/src/domain/repository/ShoppingBagRepository.dart';

class deleteShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  deleteShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.deleteShoppingBag();
}
