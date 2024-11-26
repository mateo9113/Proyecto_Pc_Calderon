import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';
// import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ClientShoppingBagBottomBar extends StatelessWidget {
  final ClientShoppingBagState state;

  ClientShoppingBagBottomBar(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.grey[200],
      child: Column(
        children: [
          Divider(
            color: Colors.grey[300],
            height: 0,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Muestra el total
              Text(
                'TOTAL: Bs.\ ${state.total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              // Botón para confirmar la venta
              SizedBox(
                width: 180,
                child: DefaultButton(
                  text: 'CONFIRMAR VENTA',
                  onPressed: state.selectedClient != null && state.products.isNotEmpty
                      ? () {
                          // Dispara el evento CreateVenta
                          BlocProvider.of<ClientShoppingBagBloc>(context).add(
                            CreateVenta(total: state.total),
                          );

                          // Muestra un mensaje de confirmación
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Venta confirmada correctamente')),
                          );
                        }
                      : () {}, // Función vacía si el botón está "deshabilitado"
                  color: state.selectedClient != null && state.products.isNotEmpty
                      ? Colors.black // Botón habilitado
                      : Colors.grey, // Botón deshabilitado
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
