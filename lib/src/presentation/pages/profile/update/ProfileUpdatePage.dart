import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Usuario.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/update/ProfileUpdateContent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  ProfileUpdateBloc? _bloc;
  Usuario? usuario;

  @override
  void initState() {
    // UNA VEZ
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // PANTALLA CARGADA
      _bloc?.add(ProfileUpdateInitEvent(usuario: usuario));
    });
  }

  @override
  Widget build(BuildContext context) {
    //   // // DESPUES DEL INIT // VARIAS VECES
    _bloc = BlocProvider.of<ProfileUpdateBloc>(context);
    usuario = ModalRoute.of(context)?.settings.arguments as Usuario;

    return Scaffold(
      body: BlocListener<ProfileUpdateBloc, ProfileUpdateState>(
        listener: (context, state) {
          final responseState = state.response;

          if (responseState is Error) {
            Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          } else if (responseState is Success) {
            Fluttertoast.showToast(msg: 'Actualizacion Exitosa', toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Stack(
                children: [
                  ProfileUpdateContent(_bloc, state, usuario),
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              );
            }
            return ProfileUpdateContent(_bloc, state, usuario);
          },
        ),
      ),
    );
  }
}
// body: BlocListener<ProfileUpdateBloc, ProfileUpdateState>(
      //   listener: (context, state) {
      //     final responseState = state.response;
      //     if (responseState is Error) {
      //       Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);
      //     } else if (responseState is Success) {
      //       Usuario usuario = responseState.data as Usuario;
      //       // _bloc?.add(ProfileUpdateUpdateUserSession(usuario: usuario));
      //       Future.delayed(Duration(seconds: 1), () {
      //         context.read<ProfileInfoBloc>().add(ProfileInfoGetUser());
      //       });
      //       Fluttertoast.showToast(msg: 'Actualizacion exitosa', toastLength: Toast.LENGTH_LONG);
      //     }
      //   },
      //   child: BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
      //     builder: (context, state) {
      //       final responseState = state.response;
      //       if (responseState is Loading) {
      //         return Stack(
      //           children: [ProfileUpdateContent(_bloc, state, usuario), Center(child: CircularProgressIndicator())],
      //         );
      //       }
      //       return ProfileUpdateContent(_bloc, state, usuario);
      //     },
      //   ),
      // ),