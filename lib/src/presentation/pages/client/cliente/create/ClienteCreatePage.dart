import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/create/ClienteCreateContent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/create/bloc/ClienteCreateBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/create/bloc/ClienteCreateState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClienteCreatePage extends StatefulWidget {
  const ClienteCreatePage({super.key});

  @override
  State<ClienteCreatePage> createState() => _ClienteCreatePageState();
}

class _ClienteCreatePageState extends State<ClienteCreatePage> {
  ClienteCreateBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClienteCreateBloc>(context);

    return Scaffold(
      body: BlocListener<ClienteCreateBloc, ClienteCreateState>(
        listener: (context, state) {
          final responseState = state.response;

          if (responseState is Success) {
            Navigator.pop(context); // Navegar hacia atrás después de la creación exitosa
            Fluttertoast.showToast(msg: 'El cliente se creó correctamente', toastLength: Toast.LENGTH_LONG);
          } else if (responseState is Error) {
            Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<ClienteCreateBloc, ClienteCreateState>(
          builder: (context, state) {
            return ClienteCreateContent(_bloc, state);
          },
        ),
      ),
    );
  }
}
