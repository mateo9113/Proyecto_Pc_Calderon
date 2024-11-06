import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/product/detail/bloc/ClientProductDetailBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/product/detail/bloc/ClientProductDetailEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/product/detail/bloc/ClientProductDetailState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultButton.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultIconBack.dart';
// import 'package:ecommerce_flutter/src/domain/models/Product.dart';
// import 'package:ecommerce_flutter/src/presentation/pages/client/product/detail/bloc/ClientProductDetailBloc.dart';
// import 'package:ecommerce_flutter/src/presentation/pages/client/product/detail/bloc/ClientProductDetailEvent.dart';
// import 'package:ecommerce_flutter/src/presentation/pages/client/product/detail/bloc/ClientProductDetailState.dart';
// import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
// import 'package:ecommerce_flutter/src/presentation/widgets/DefaultIconBack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class ClientProductDetailContent extends StatelessWidget {
  Product? product;
  ClientProductDetailBloc? bloc;
  ClientProductDetailState state;

  ClientProductDetailContent(this.bloc, this.state, this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageSlideshow(),
            _textName(),
            _textDescription(),
            _textPrice(),
            Spacer(),
            Divider(color: Colors.grey[300], height: 0, thickness: 2),
            _actionsShoppingBag()
          ],
        ),
        DefaultIconback(
          left: 15,
          top: 35,
          color: Colors.black,
        )
      ],
    );
  }

  Widget _actionsShoppingBag() {
    return Container(
      color: Colors.grey[100],
      width: double.infinity,
      padding: EdgeInsets.only(top: 15, bottom: 20, left: 30, right: 30),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              bloc?.add(SubtractItem());
            },
            child: Container(
              width: 40,
              height: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  )),
              child: Text(
                '-',
                style: TextStyle(fontSize: 23),
              ),
            ),
          ),
          Container(
            width: 40,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Text(
              state.quantity.toString(),
              style: TextStyle(fontSize: 23),
            ),
          ),
          GestureDetector(
            onTap: () {
              bloc?.add(AddItem());
            },
            child: Container(
              width: 40,
              height: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
              child: Text(
                '+',
                style: TextStyle(fontSize: 23),
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 150,
            child: DefaultButton(
                text: 'AGREGAR',
                onPressed: () {
                  Fluttertoast.showToast(msg: 'Se agrego el producto', toastLength: Toast.LENGTH_LONG);
                  bloc?.add(AddProductToShoppingBag(product: product!));
                }),
          )
        ],
      ),
    );
  }

  Widget _textName() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 30),
      child: Text(
        product?.nombre ?? '',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textDescription() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 15),
      child: Text(
        product?.descripcion ?? '',
        style: TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }

  Widget _textPrice() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 15),
      child: Text(
        'Precio: Bs. ${product?.precio ?? ''}',
        style: TextStyle(fontSize: 17, color: Colors.green, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _imageSlideshow() {
    return ImageSlideshow(
      width: double.infinity,
      height: 300,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      children: [
        product!.imagen1!.isNotEmpty
            ? FadeInImage.assetNetwork(
                placeholder: 'assets/img/user_image.png',
                image: product!.imagen1!,
                fit: BoxFit.contain,
                fadeInDuration: Duration(seconds: 1),
              )
            : Container(),
        product!.imagen2!.isNotEmpty
            ? FadeInImage.assetNetwork(
                placeholder: 'assets/img/user_image.png',
                image: product!.imagen2!,
                fit: BoxFit.contain,
                fadeInDuration: Duration(seconds: 1),
              )
            : Container(),
      ],

      /// Called whenever the page in the center of the viewport changes.
      onPageChanged: (value) {
        print('Page changed: $value');
      },
      // autoPlayInterval: 10000,
      // isLoop: true,
    );
  }
}
