import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/product/list/bloc/ClientProductListBloc.dart';
// import 'package:ecommerce_flutter/src/domain/models/Product.dart';
// import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClientProductListBloc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClientProductListItem extends StatelessWidget {
  ClientProductListBloc? bloc;
  Product? product;

  ClientProductListItem(this.bloc, this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'client/product/detail', arguments: product);
      },
      child: ListTile(
        trailing: product != null
            ? SizedBox(
                width: 70,
                child: product!.imagen1!.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/img/no-image.png',
                        image: product!.imagen1!,
                        fit: BoxFit.contain,
                        fadeInDuration: Duration(seconds: 1),
                      )
                    : Container(),
              )
            : Container(),
        title: Text(product?.nombre ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(product?.descripcion ?? ''),
            SizedBox(height: 5),
            Text(
              'Bs. ${product?.precio.toString() ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Catidad : ${product?.stock.toString() ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        // contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
      ),
    );
  }
}
