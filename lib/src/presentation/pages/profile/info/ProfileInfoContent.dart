import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileInfoContent extends StatelessWidget {
  Usuario? usuario;

  ProfileInfoContent(this.usuario, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _imageBackground(context),
        Column(
          children: [_imageProfile(), Spacer(), _cardProfileInfo(context)],
        )
      ],
    );
  }

  Widget _cardProfileInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
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
            ListTile(
              title: Text('${usuario?.nombre ?? ''} ${usuario?.apellido ?? ''}'),
              subtitle: Text('Nombre de usuario'),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text(usuario?.correo ?? ''),
              subtitle: Text('Correo electronico'),
              leading: Icon(Icons.email),
            ),
            ListTile(
              title: Text(usuario?.telefono ?? ''),
              subtitle: Text('Telefono'),
              leading: Icon(Icons.phone),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 10),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, 'profile/update', arguments: usuario);
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _imageProfile() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      width: 150,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipOval(
          child: usuario != null && usuario!.imagen != null && usuario!.imagen!.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/img/admin.png',
                  image: usuario!.imagen!,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(seconds: 1),
                )
              : Image.asset(
                  'assets/img/admin.png', // Imagen predeterminada si no hay imagen del usuario
                  fit: BoxFit.cover,
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
