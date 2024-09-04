// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/AuthService.dart'
    as _i502;
import 'package:app_proyecto_pccalderon/src/di/AppModule.dart' as _i459;
import 'package:app_proyecto_pccalderon/src/domain/repository/AuthRepository.dart'
    as _i298;
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/AuthUseCases.dart'
    as _i993;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i502.AuthService>(() => appModule.authService);
    gh.factory<_i298.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i993.AuthUseCases>(() => appModule.authUseCases);
    return this;
  }
}

class _$AppModule extends _i459.AppModule {}