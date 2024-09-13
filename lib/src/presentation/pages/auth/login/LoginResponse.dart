import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginResponse extends StatelessWidget {
  LoginBloc? bloc;

  LoginResponse(this.bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc?.responseStream,
      builder: (context, snapshot) {
        final state = snapshot.data;
        if (state is Loading) {
          return Center(child: CircularProgressIndicator(color: Colors.red));
        } else if (state is Error) {
          Fluttertoast.showToast(msg: state.message, toastLength: Toast.LENGTH_LONG);
        } else if (state is Success) {
          Fluttertoast.showToast(msg: 'Login Exitoso', toastLength: Toast.LENGTH_LONG);
        }
        return Container();
      },
    );
  }
}
