import 'package:app_proyecto_pccalderon/src/domain/models/Category.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdminCategoryListItem extends StatelessWidget {
  AdminCategoryListBloc? bloc;
  Category? category;

  AdminCategoryListItem(this.bloc, this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'admin/product/list', arguments: category);
      },
      child: ListTile(
        leading: category != null
            ? SizedBox(
                width: 70,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/img/no-image.png',
                  image: category!.imagen!,
                  fit: BoxFit.contain,
                  fadeInDuration: Duration(seconds: 1),
                ),
              )
            : Container(),
        title: Text(category?.nombre ?? ''),
        subtitle: Text(category?.descripcion ?? ''),
        // contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
        trailing: Wrap(
          direction: Axis.horizontal,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'admin/category/update', arguments: category);
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  bloc?.add(DeleteCategory(id: category!.id!));
                },
                icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
