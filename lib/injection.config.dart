// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_proyecto_pccalderon/src/data/dataSource/local/SharedPref.dart'
    as _i699;
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/AuthService.dart'
    as _i502;
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/CategoriesService.dart'
    as _i477;
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/ClienteService.dart'
    as _i210;
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/OrdersService.dart'
    as _i666;
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/ProductsService.dart'
    as _i606;
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/UsersService.dart'
    as _i1072;
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/VentasService.dart'
    as _i864;
import 'package:app_proyecto_pccalderon/src/di/AppModule.dart' as _i459;
import 'package:app_proyecto_pccalderon/src/domain/repository/AuthRepository.dart'
    as _i298;
import 'package:app_proyecto_pccalderon/src/domain/repository/CategoriesRepository.dart'
    as _i537;
import 'package:app_proyecto_pccalderon/src/domain/repository/ClienteRepository.dart'
    as _i741;
import 'package:app_proyecto_pccalderon/src/domain/repository/ProductsRepository.dart'
    as _i382;
import 'package:app_proyecto_pccalderon/src/domain/repository/ShoppingBagRepository.dart'
    as _i957;
import 'package:app_proyecto_pccalderon/src/domain/repository/UsersRepository.dart'
    as _i102;
import 'package:app_proyecto_pccalderon/src/domain/repository/VentaRepository.dart'
    as _i13;
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/AuthUseCases.dart'
    as _i993;
import 'package:app_proyecto_pccalderon/src/domain/useCases/categories/CategoriesUseCases.dart'
    as _i449;
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/ClientesUseCases.dart'
    as _i81;
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/ProductsUseCases.dart'
    as _i950;
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart'
    as _i536;
import 'package:app_proyecto_pccalderon/src/domain/useCases/users/UsersUseCases.dart'
    as _i495;
import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/VentasUseCases.dart'
    as _i78;
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
    gh.factory<_i699.SharedPref>(() => appModule.sharedPref);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i502.AuthService>(() => appModule.authService);
    gh.factory<_i1072.UsersService>(() => appModule.usersService);
    gh.factory<_i477.CategoriesService>(() => appModule.categoriesService);
    gh.factory<_i606.ProductsService>(() => appModule.productsService);
    gh.factory<_i666.OrdersService>(() => appModule.ordersService);
    gh.factory<_i210.ClienteService>(() => appModule.clienteService);
    gh.factory<_i864.VentasService>(() => appModule.ventasService);
    gh.factory<_i298.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i102.UsersRepository>(() => appModule.usersRepository);
    gh.factory<_i537.CategoriesRepository>(
        () => appModule.categoriesRepository);
    gh.factory<_i382.ProductsRepository>(() => appModule.productsRepository);
    gh.factory<_i957.ShoppingBagRepository>(
        () => appModule.shoppingBagRepository);
    gh.factory<_i741.ClienteRepository>(() => appModule.clienteRepository);
    gh.factory<_i13.VentaRepository>(() => appModule.ventaRepository);
    gh.factory<_i993.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i495.UsersUseCases>(() => appModule.usersUseCases);
    gh.factory<_i449.CategoriesUseCases>(() => appModule.categoriesUseCases);
    gh.factory<_i950.ProductsUseCases>(() => appModule.productsUseCases);
    gh.factory<_i536.ShoppingBagUseCases>(() => appModule.shoppingBagUseCases);
    gh.factory<_i78.VentasUseCases>(() => appModule.ventasUseCases);
    gh.factory<_i81.ClientesUseCases>(() => appModule.clientesUseCases);
    return this;
  }
}

class _$AppModule extends _i459.AppModule {}
