import 'package:app_proyecto_pccalderon/src/domain/models/Order.dart';
// import 'package:ecommerce_flutter/src/domain/models/Order.dart';
import 'package:flutter/material.dart';

class AdminOrderDetailItem extends StatelessWidget {
  OrderHasProduct? orderHasProduct;

  AdminOrderDetailItem(this.orderHasProduct, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: orderHasProduct != null
          ? SizedBox(
              width: 70,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/img/no-image.png',
                image: orderHasProduct!.product.imagen1!,
                fit: BoxFit.contain,
                fadeInDuration: Duration(seconds: 1),
              ),
            )
          : Container(),
      title: Text(orderHasProduct?.product.nombre ?? ''),
      subtitle: Text('Cantidad: ${orderHasProduct?.quantity}'),
    );
  }
}
