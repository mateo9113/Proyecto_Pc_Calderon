import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/RegisterContent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/RegisterResponse.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultButton.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultDropdownButtonFormField.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultIconBack.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBlocCubit? _registerBlocCubit;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _registerBlocCubit?.dispose(); // para la validacion
    });
  }

  @override
  Widget build(BuildContext context) {
    _registerBlocCubit =
        BlocProvider.of<RegisterBlocCubit>(context, listen: false);

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: Colors.black, // o double.infinity
          child: Stack(
            alignment: Alignment.center,
            children: [
              RegisterContent(_registerBlocCubit),
              RegisterResponse(_registerBlocCubit)
            ],
          )),
    );
  }
}
