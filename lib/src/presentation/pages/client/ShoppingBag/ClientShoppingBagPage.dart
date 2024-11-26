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
        actions: [
          IconButton(
            icon: Icon(Icons.people), // Icono para acceder a la lista de clientes
            onPressed: () {
              _bloc?.add(GetClients()); // Disparar el evento para obtener clientes
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BlocBuilder<ClientShoppingBagBloc, ClientShoppingBagState>(
                    builder: (context, state) {
                      if (state.clients == null) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state.clients!.isEmpty) {
                        return Center(child: Text('No hay clientes disponibles.'));
                      }
                      return ListView.builder(
                        itemCount: state.clients!.length,
                        itemBuilder: (context, index) {
                          final cliente = state.clients![index];
                          return ListTile(
                            title: Text(cliente.nombre), // Cambia 'nombre' según tu modelo
                            onTap: () {
                              _bloc?.add(SelectClient(selectedClient: cliente)); // Seleccionar cliente
                              Navigator.pop(context); // Cerrar el modal
                            },
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 210, 209, 207),
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
          return ClientShoppingBagBottomBar(state); // Mantén solo la barra personalizada
        },
      ),
    );
  }
}
