import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/ClientShoppingBagBottomBar.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/ClientShoppingBagItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagState.dart';

class ClientShoppingBagPage extends StatefulWidget {
  const ClientShoppingBagPage({super.key});

  @override
  State<ClientShoppingBagPage> createState() => _ClientShoppingBagPageState();
}

class _ClientShoppingBagPageState extends State<ClientShoppingBagPage> {
  ClientShoppingBagBloc? _bloc;
  TextEditingController _discountController = TextEditingController();

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
            return ListView(
              children: [
                // Lista de productos en el carrito
                ...state.products.map((product) {
                  return ClientShoppingBagItem(_bloc, state, product);
                }).toList(),

                // Mostrar el total con el descuento aplicado
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \$${(state.total).toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                // Campo para ingresar el monto de descuento
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _discountController,
                    decoration: InputDecoration(
                      labelText: 'Monto de descuento',
                      hintText: 'Ingresa el descuento',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final descuento = double.tryParse(value) ?? 0;
                      _bloc?.add(UpdateDiscount(descuento: descuento));
                    },
                  ),
                ),
              ],
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
