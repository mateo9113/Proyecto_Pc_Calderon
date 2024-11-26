import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';

abstract class ShoppingBagRepository {
  Future<void> add(Product product);
  // Future<void> subtract(Product product);
  Future<List<Product>> getProducts();
  Future<void> deleteItem(Product product);
  Future<void> deleteShoppingBag();
  Future<double> getTotal();
  Future<void> updateProductStock(int productId, int newStock);
}
