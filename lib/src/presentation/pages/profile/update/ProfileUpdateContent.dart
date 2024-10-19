import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultIconBack.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileUpdateContent extends StatelessWidget {
  ProfileUpdateBloc? bloc;
  ProfileUpdateState state;
  Usuario? usuario;

  ProfileUpdateContent(
    this.bloc,
    this.state,
    this.usuario,
    /*{super.key}*/
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _imageBackground(context),
        SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _imageProfile(context),
                _cardProfileInfo(context),
              ],
            ),
          ),
        ),
        DefaultIconback(left: 15, top: 50)
      ],
    );
    // Form(
    //   key: state.formKey,
    //   child:
    //   Stack(
    //     alignment: Alignment.center,
    //     children: [
    //       _imageBackground(context),
    //       SingleChildScrollView(
    //         child: SizedBox(
    //           height: MediaQuery.of(context).size.height,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               _imageProfile(context),
    //               _cardProfileInfo(context),
    //             ],
    //           ),
    //         ),
    //       ),
    //       DefaultIconback(left: 15, top: 50)
    //     ],
    //   ),
    // );
  }

  Widget _cardProfileInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.44,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            _textUpdateInfo(),
            _textFieldName(),
            _textFieldLastname(),
            _textFieldPhone(),
            _fabSubmit(),
          ],
        ),
      ),
    );
  }

  Widget _fabSubmit() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 10, top: 20),
      child: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          bloc?.add(ProfileUpdateFormSubmit());
        },
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _textUpdateInfo() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 25, left: 35, bottom: 10),
      child: Text(
        'ACTUALIZAR INFORMACION',
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
          label: 'Nombre',
          icon: Icons.person,
          color: Colors.black,
          initialValue: usuario?.nombre ?? '',
          onChanged: (text) {
            bloc?.add(ProfileUpdateNameChanged(nombre: BlocFormItem(value: text)));
          },
          validator: (value) {
            return state.nombre.error;
          },
        ));
  }

  Widget _textFieldLastname() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
          label: 'Apellido',
          color: Colors.black,
          icon: Icons.person_outline,
          initialValue: usuario?.apellido ?? '',
          onChanged: (text) {
            bloc?.add(ProfileUpdateLastnameChanged(apellido: BlocFormItem(value: text)));
          },
          validator: (value) {
            return state.apellido.error;
          },
        ));
  }

  Widget _textFieldPhone() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
          label: 'Telefono',
          icon: Icons.phone,
          color: Colors.black,
          initialValue: usuario?.telefono ?? '',
          onChanged: (text) {
            bloc?.add(ProfileUpdatePhoneChanged(telefono: BlocFormItem(value: text)));
          },
          validator: (value) {
            return state.telefono.error;
          },
        ));
  }

  Widget _imageProfile(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectOptionImageDialog(
          context,
          () {
            bloc?.add(ProfileUpdatePickImage());
          },
          () {
            bloc?.add(ProfileUpdateTakePhoto());
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 100),
        width: 150,
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
            child: state.imagen != null
                ? Image.file(
                    state.imagen!,
                    fit: BoxFit.cover,
                  )
                : FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    image: usuario!.imagen!,
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/fondo.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
