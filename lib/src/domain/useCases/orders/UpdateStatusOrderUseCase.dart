import 'package:app_proyecto_pccalderon/src/domain/repository/OrdersRepository.dart';
// import 'package:ecommerce_flutter/src/domain/repository/OrdersRepository.dart';

class UpdateStatusOrderUseCase {
  OrdersRepository ordersRepository;

  UpdateStatusOrderUseCase(this.ordersRepository);

  run(int id) => ordersRepository.updateStatus(id);
}
