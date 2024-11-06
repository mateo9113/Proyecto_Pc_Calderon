import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/ClientShoppingBagBottomBar.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/ClientShoppingBagItem.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientShoppingBagPage extends StatefulWidget {
  const ClientShoppingBagPage({super.key});

  @override
  State<ClientShoppingBagPage> createState() => _ClientShoppingBagPageState();
}

class _ClientShoppingBagPageState extends State<ClientShoppingBagPage> {
  ClientShoppingBagBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetShoppingBag());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientShoppingBagBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Venta'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 210, 209, 207),
          // INTEGRAR FONDO O IAMMGEN
          // image: DecorationImage(
          //   image: AssetImage("assets/img/background1.jpg"), // Ruta de la imagen de fondo
          //   fit: BoxFit.cover,
          // ),
        ),
        child: BlocBuilder<ClientShoppingBagBloc, ClientShoppingBagState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ClientShoppingBagItem(_bloc, state, state.products[index]);
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<ClientShoppingBagBloc, ClientShoppingBagState>(
        builder: (context, state) {
          return ClientShoppingBagBottomBar(state);
        },
      ),
    );
  }
}
