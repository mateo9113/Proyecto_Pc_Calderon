import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/list/ClienteListItem.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/list/bloc/ClienteListState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/list/bloc/ClienteListBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/list/bloc/ClienteListEvent.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClienteListPage extends StatefulWidget {
  const ClienteListPage({super.key});

  @override
  State<ClienteListPage> createState() => _ClienteListPageState();
}

class _ClienteListPageState extends State<ClienteListPage> {
  ClienteListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(const LoadClientes());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClienteListBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Clientes'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _bloc?.add(const LoadClientes()); // Recargar la lista al presionar el botón
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, 'client/cliente/create');
          if (result == true) {
            _bloc?.add(const LoadClientes());
          }
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocListener<ClienteListBloc, ClienteListState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            if (responseState.data is bool) {
              _bloc?.add(const LoadClientes());
            }
          }
          if (responseState is Error) {
            Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<ClienteListBloc, ClienteListState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              List<Cliente> clientes = responseState.data as List<Cliente>;
              return ListView.builder(
                itemCount: clientes.length,
                itemBuilder: (context, index) {
                  return ClienteListItem(_bloc, clientes[index]);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
