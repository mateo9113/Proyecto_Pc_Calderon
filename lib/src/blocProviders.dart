import 'package:app_proyecto_pccalderon/injection.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/users/UsersUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/roles/bloc/RolesBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/roles/bloc/RolesEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<AuthUseCases>())..add(InitEvent())),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  BlocProvider<RolesBloc>(create: (context) => RolesBloc(locator<AuthUseCases>())..add(GetRolesList())),
  BlocProvider<AdminHomeBloc>(create: (context) => AdminHomeBloc(locator<AuthUseCases>())),
  BlocProvider<ProfileInfoBloc>(
      create: (context) => ProfileInfoBloc(locator<AuthUseCases>())..add(ProfileInfoGetUser())),
  BlocProvider<ProfileUpdateBloc>(create: (context) => ProfileUpdateBloc()..add(ProfileUpdateInitEvent()))
  // BlocProvider<ProfileUpdateBloc>(
  // create: (context) => ProfileUpdateBloc(locator<UsersUseCases>(), locator<AuthUseCases>())),
];
