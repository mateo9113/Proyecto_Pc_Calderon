import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/AddShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/GetProductsShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/GetTotalShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/UpdateProductStockUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/GetClientesUseCase.dart';

class ShoppingBagUseCases {
  AddShoppingBagUseCase add;
  GetProductsShoppingBagUseCase getProducts;
  DeleteItemShoppinBagUseCase deleteItem;
  deleteShoppingBagUseCase deleteShoppingBag;
  GetTotalShoppingBagUseCase getTotal;
  GetClientesUseCase getClients; // Nuevo caso de uso para obtener clientes
  final UpdateProductStockUseCase updateProductStock; // Nuevo caso de uso

  ShoppingBagUseCases({
    required this.add,
    required this.getProducts,
    required this.deleteItem,
    required this.deleteShoppingBag,
    required this.getTotal,
    required this.getClients, // Agregado aquí
    required this.updateProductStock, // Asegúrate de inicializarlo
  });
}
