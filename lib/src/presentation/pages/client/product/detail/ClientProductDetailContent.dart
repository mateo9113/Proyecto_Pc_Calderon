import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/product/detail/bloc/ClientProductDetailBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/product/detail/bloc/ClientProductDetailEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/product/detail/bloc/ClientProductDetailState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultButton.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultIconBack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

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
            _stockWarning(),
            Spacer(),
            Divider(color: Colors.grey[300], height: 0, thickness: 2),
            _actionsShoppingBag(context),
          ],
        ),
        DefaultIconback(
          left: 15,
          top: 35,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget _stockWarning() {
    if (product!.stock <= 0) {
      return Container(
        margin: EdgeInsets.only(left: 30, top: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.orange[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Producto agotado o no disponible',
          style: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.bold),
        ),
      );
    }
    return SizedBox.shrink(); // No muestra nada si hay stock
  }

  Widget _actionsShoppingBag(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      width: double.infinity,
      padding: EdgeInsets.only(top: 15, bottom: 20, left: 30, right: 30),
      child: Column(
        children: [
          if (state.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  state.errorMessage!,
                  style: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  bloc?.add(SubtractItem(product!));
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
                    ),
                  ),
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
                  if (product!.stock <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Producto agotado. No hay stock disponible."),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    bloc?.add(AddItem(product!));
                  }
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
                    ),
                  ),
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
                    if (state.quantity <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Debe seleccionar al menos 1 producto."),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      bloc?.add(AddProductToShoppingBag(product: product!));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Producto agregado correctamente."),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
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
      onPageChanged: (value) {
        print('Page changed: $value');
      },
    );
  }
}
