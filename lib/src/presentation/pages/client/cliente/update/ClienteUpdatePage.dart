import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/update/ClienteUpdateContent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/update/bloc/ClienteUpdateBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/update/bloc/UpdateClienteEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/update/bloc/UpdateClienteState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClienteUpdatePage extends StatefulWidget {
  const ClienteUpdatePage({super.key});

  @override
  State<ClienteUpdatePage> createState() => _ClienteUpdatePageState();
}

class _ClienteUpdatePageState extends State<ClienteUpdatePage> {
  Cliente? cliente;
  ClienteUpdateBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(ClienteUpdateInitEvent(cliente: cliente));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc?.add(ResetForm());
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClienteUpdateBloc>(context);
    cliente = ModalRoute.of(context)?.settings.arguments as Cliente;

    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar Cliente'),
      ),
      body: BlocListener<ClienteUpdateBloc, ClienteUpdateState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            Fluttertoast.showToast(msg: 'El cliente se actualizó correctamente', toastLength: Toast.LENGTH_LONG);
            Navigator.pop(context); // Regresar a la lista después de actualizar
          } else if (responseState is Error) {
            Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<ClienteUpdateBloc, ClienteUpdateState>(
          builder: (context, state) {
            return ClienteUpdateContent(_bloc, state, cliente);
          },
        ),
      ),
    );
  }
}
