import 'package:app_proyecto_pccalderon/src/domain/repository/OrdersRepository.dart';
// import 'package:ecommerce_flutter/src/domain/repository/OrdersRepository.dart';

class GetOrdersUseCase {
  OrdersRepository ordersRepository;

  GetOrdersUseCase(this.ordersRepository);

  run() => ordersRepository.getOrders();
}
