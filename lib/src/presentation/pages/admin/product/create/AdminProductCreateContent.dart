import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/create/bloc/AdminProductCreateEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/create/bloc/AdminProductCreateState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultIconBack.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdminProductCreateContent extends StatelessWidget {
  AdminProductCreateBloc? bloc;
  AdminProductCreateState state;

  AdminProductCreateContent(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: state.formKey,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _imageBackground(context),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_imageProductOne(context), SizedBox(width: 20), _imageProductTwo(context)],
                    ),
                    _cardCategoryForm(context)
                  ],
                ),
              ),
            ),
            DefaultIconback(left: 15, top: 50)
          ],
        ));
  }

  Widget _cardCategoryForm(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.53,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            _textNewProduct(),
            _textFieldName(),
            _textFieldDescription(),
            _textFieldPrice(),
            _textFieldCantidad(),
            _textFieldCodEAN(),
            _fabSubmit()
          ],
        ),
      ),
    );
  }

  Widget _fabSubmit() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 30),
      child: FloatingActionButton(
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            bloc?.add(FormSubmit());
          }
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _textNewProduct() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10, bottom: 10),
      child: Text(
        'NUEVO PRODUCTO',
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget _textFieldName() {
    return DefaultTextField(
      label: 'Nombre del producto',
      icon: Icons.category,
      onChanged: (text) {
        bloc?.add(NameChanged(nombre: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.nombre.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldPrice() {
    return DefaultTextField(
      label: 'Precio del producto',
      icon: Icons.money,
      textInputType: TextInputType.phone,
      onChanged: (text) {
        bloc?.add(PriceChanged(precio: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.precio.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldDescription() {
    return DefaultTextField(
      label: 'Descripcion',
      icon: Icons.list,
      onChanged: (text) {
        bloc?.add(DescriptionChanged(descripcion: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.descripcion.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldCantidad() {
    return DefaultTextField(
      label: 'Stock del producto',
      icon: Icons.ac_unit_rounded,
      onChanged: (text) {
        bloc?.add(CantidadChanged(stock: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.stock.error;
      },
      color: Colors.black,
    );
  }

  Widget _imageProductOne(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectOptionImageDialog(
          context,
          () {
            bloc?.add(PickImage(numberFile: 1));
          },
          () {
            bloc?.add(TakePhoto(numberFile: 1));
          },
        );
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
              child: state.file1 != null
                  ? Image.file(
                      state.file1!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/img/no-image.png',
                      fit: BoxFit.cover,
                    )),
        ),
      ),
    );
  }

  Widget _imageProductTwo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectOptionImageDialog(
          context,
          () {
            bloc?.add(PickImage(numberFile: 2));
          },
          () {
            bloc?.add(TakePhoto(numberFile: 2));
          },
        );
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
              child: state.file2 != null
                  ? Image.file(
                      state.file2!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/img/no-image.png',
                      fit: BoxFit.cover,
                    )),
        ),
      ),
    );
  }

  Widget _textFieldCodEAN() {
    return DefaultTextField(
      label: 'Código EAN',
      icon: Icons.qr_code,
      onChanged: (text) {
        bloc?.add(CodEANChanged(codEAN: BlocFormItem(value: text))); // Evento relacionado con `cod_EAN`
      },
      validator: (value) {
        return state.codEAN.error; // Validación del campo
      },
      color: Colors.black,
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background1.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
