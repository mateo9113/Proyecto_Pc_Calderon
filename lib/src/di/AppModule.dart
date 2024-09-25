import 'package:app_proyecto_pccalderon/src/data/dataSource/local/SharedPref.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/AuthRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/AuthService.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/AuthRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  AuthService get authService => AuthService();

  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService, sharedPref);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCase(authRepository),
      saveUserSession: SaveUserSessionUseCase(authRepository),
      getUserSession: GetUserSessionUseCase(authRepository));
}
