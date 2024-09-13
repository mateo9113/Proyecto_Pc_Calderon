import 'package:app_proyecto_pccalderon/injection.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<AuthUseCases>())..add(InitEvent())),
  BlocProvider<RegisterBlocCubit>(create: (context) => RegisterBlocCubit(locator<AuthUseCases>()))
];
