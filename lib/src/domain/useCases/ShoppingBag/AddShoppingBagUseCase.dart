import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ShoppingBagRepository.dart';
// import 'package:ecommerce_flutter/src/domain/models/Product.dart';
// import 'package:ecommerce_flutter/src/domain/repository/ShoppingBagRepository.dart';

class AddShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  AddShoppingBagUseCase(this.shoppingBagRepository);

  run(Product product) => shoppingBagRepository.add(product);
}
