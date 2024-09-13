import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginResponse extends StatelessWidget {
  LoginBloc? bloc;
  LoginState state;

  LoginResponse(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      final responseState = state.response;
      if (responseState is Loading) {
        return Center(child: CircularProgressIndicator(color: Colors.red));
      } else if (responseState is Error) {
        Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);
      } else if (responseState is Success) {
        Fluttertoast.showToast(msg: 'Login Exitoso', toastLength: Toast.LENGTH_LONG);
      }
      return Container();
    });
  }
}
