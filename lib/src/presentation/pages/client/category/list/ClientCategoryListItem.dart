import 'package:app_proyecto_pccalderon/src/domain/models/Category.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/category/list/bloc/ClientCategoryListBloc.dart';
// import 'package:ecommerce_flutter/src/domain/models/Category.dart';
// import 'package:ecommerce_flutter/src/presentation/pages/client/category/list/bloc/ClientCategoryListBloc.dart';
import 'package:flutter/material.dart';

class ClientCategoryListItem extends StatelessWidget {
  ClientCategoryListBloc? bloc;
  Category? category;

  ClientCategoryListItem(this.bloc, this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'client/product/list', arguments: category);
        },
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                category != null
                    ? SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: category!.imagen!.isNotEmpty
                            ? FadeInImage.assetNetwork(
                                placeholder: 'assets/img/no-image.png',
                                image: category!.imagen!,
                                fit: BoxFit.contain,
                                fadeInDuration: Duration(seconds: 1),
                              )
                            : Container(),
                      )
                    : Container(),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 15),
                  child: Text(
                    category?.nombre ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 7, left: 15, bottom: 15),
                  child: Text(
                    category?.descripcion ?? '',
                    style: TextStyle(color: Colors.grey[600], fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
