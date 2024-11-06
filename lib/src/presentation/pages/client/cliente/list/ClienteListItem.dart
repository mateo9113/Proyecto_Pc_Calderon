import 'package:flutter/material.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/list/bloc/ClienteListBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/list/bloc/ClienteListEvent.dart';

// ignore: must_be_immutable
class ClienteListItem extends StatelessWidget {
  final ClienteListBloc? bloc;
  final Cliente cliente;

  ClienteListItem(this.bloc, this.cliente, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(cliente.nombre),
      subtitle: Text('Documento: ${cliente.numDocumento} - Teléfono: ${cliente.telefono}'),
      trailing: Wrap(
        spacing: 12,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(context, 'client/cliente/update', arguments: cliente);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              bloc?.add(DeleteCliente(id: cliente.id!));
            },
          ),
        ],
      ),
    );
  }
}
