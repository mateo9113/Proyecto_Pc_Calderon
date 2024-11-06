import 'package:app_proyecto_pccalderon/src/data/dataSource/local/SharedPref.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/CategoriesService.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/ClienteService.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/OrdersService.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/ProductsService.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/UsersService.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/AuthRepositoryImpl.dart';

import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/AuthService.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/CategoriesRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/ClienteRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/ProductsRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/ShoppingBagRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/UsersRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/AuthResponse.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/AuthRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/CategoriesRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ClienteRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ShoppingBagRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/UsersRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/AddShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/GetProductsShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/GetTotalShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/categories/CreateCategoryUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/categories/DeleteCategoryUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/categories/GetCategoriesUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/categories/UpdateCategoryUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/ClientesUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/CreateClienteUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/DeleteClienteUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/GetClientesUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/UpdateClienteUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/CreateProductUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/DeleteProductUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/GetProductsByCategoryUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/UpdateProductUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/users/UpdateUserUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/users/UsersUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ProductsRepository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  SharedPref get sharedPref => SharedPref();

  Future<String> get token async {
    String token = "";
    final userSession = await sharedPref.read('usuario');
    if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
    }
    return token;
  }

  @injectable
  AuthService get authService => AuthService();

  @injectable
  UsersService get usersService => UsersService(token);

  @injectable
  CategoriesService get categoriesService => CategoriesService(token);

  @injectable
  ProductsService get productsService => ProductsService(token);

  @injectable
  OrdersService get ordersService => OrdersService(token);
  @injectable
  ClienteService get clienteService => ClienteService(token);

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService, sharedPref);

  @injectable
  UsersRepository get usersRepository => UsersRepositoryImpl(usersService);

  @injectable
  CategoriesRepository get categoriesRepository => CategoriesRepositoryImpl(categoriesService);
  @injectable
  ProductsRepository get productsRepository => ProductsRepositoryImpl(productsService);
  @injectable
  ShoppingBagRepository get shoppingBagRepository => ShoppingBagRepositoryImpl(sharedPref);

  @injectable
  ClienteRepository get clienteRepository => ClienteRepositoryImpl(clienteService);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
        login: LoginUseCase(authRepository),
        register: RegisterUseCase(authRepository),
        saveUserSession: SaveUserSessionUseCase(authRepository),
        getUserSession: GetUserSessionUseCase(authRepository),
        logout: LogoutUseCase(authRepository),
      );

  @injectable
  UsersUseCases get usersUseCases => UsersUseCases(
        updateUser: UpdateUserUseCase(usersRepository),
      );

  @injectable
  CategoriesUseCases get categoriesUseCases => CategoriesUseCases(
        create: CreateCategoryUseCase(categoriesRepository),
        getCategories: GetCategoriesUseCase(categoriesRepository),
        update: UpdateCategoryUseCase(categoriesRepository),
        delete: DeleteCategoryUseCase(categoriesRepository),
      );

  @injectable
  ProductsUseCases get productsUseCases => ProductsUseCases(
      create: CreateProductUseCase(productsRepository),
      getProductsByCategory: GetProductsByCategoryUseCase(productsRepository),
      update: UpdateProductUseCase(productsRepository),
      delete: DeleteProductUseCase(productsRepository));

  ShoppingBagUseCases get shoppingBagUseCases => ShoppingBagUseCases(
      add: AddShoppingBagUseCase(shoppingBagRepository),
      getProducts: GetProductsShoppingBagUseCase(shoppingBagRepository),
      deleteItem: DeleteItemShoppinBagUseCase(shoppingBagRepository),
      deleteShoppingBag: deleteShoppingBagUseCase(shoppingBagRepository),
      getTotal: GetTotalShoppingBagUseCase(shoppingBagRepository));

  @injectable
  ClientesUseCases get clientesUseCases => ClientesUseCases(
        create: CreateClienteUseCase(clienteRepository),
        getClientes: GetClientesUseCase(clienteRepository),
        update: UpdateClienteUseCase(clienteRepository),
        delete: DeleteClienteUseCase(clienteRepository),
      );
}
