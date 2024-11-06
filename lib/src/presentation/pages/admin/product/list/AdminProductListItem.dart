import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/list/bloc/AdminProductListEvent.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdminProductListItem extends StatelessWidget {
  AdminProductListBloc? bloc;
  Product? product;

  AdminProductListItem(this.bloc, this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'admin/product/list', arguments: category);
      },
      child: ListTile(
        leading: product != null
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
              ' Bs. ${product?.precio.toString() ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Catidad : ${product?.stock.toString() ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        // contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
        trailing: Wrap(
          direction: Axis.horizontal,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'admin/product/update', arguments: product);
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  bloc?.add(DeleteProduct(id: product!.id!));
                },
                icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
