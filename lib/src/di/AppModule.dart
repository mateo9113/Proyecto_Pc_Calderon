import 'package:app_proyecto_pccalderon/src/data/dataSource/local/SharedPref.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/CategoriesService.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/ClienteService.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/OrdersService.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/ProductsService.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/ReporteService.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/UsersService.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/VentasService.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/AuthRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/data/dataSource/remote/service/AuthService.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/CategoriesRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/ClienteRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/ProductsRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/ReportesRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/ShoppingBagRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/UsersRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/data/repository/VentasRepositoryImpl.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/AuthResponse.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/AuthRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/CategoriesRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ClienteRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ReportesRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ShoppingBagRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/UsersRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/VentaRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/AddShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/GetProductsShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/GetTotalShoppingBagUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/UpdateProductStockUseCase.dart';
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
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/GetClienteByIdUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/GetClientesUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/UpdateClienteUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/CreateProductUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/DeleteProductUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/GetProductsByCategoryUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/UpdateProductUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetProductosMasVendidosUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetProformaUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetReporteClientesUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetReporteInventarioUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetReporteProductosUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetReporteVentasUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetVentasPorClienteUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/GetVentasPorFechaUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/reportes/ReportesUseCaases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/users/UpdateUserUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/users/UsersUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/repository/ProductsRepository.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/CreateVentaUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/DeleteVentaUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/GetVentasUseCase.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/VentasUseCases.dart';
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

  //**Nuevo: Servicio de Ventas**
  @injectable
  VentasService get ventasService => VentasService(token);

  // Nuevo: Servicio de Ventas
  // Nuevo: Servicio de Reportes
  @injectable
  ReportesService get reportesService => ReportesService();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService, sharedPref);

  @injectable
  UsersRepository get usersRepository => UsersRepositoryImpl(usersService);

  @injectable
  CategoriesRepository get categoriesRepository => CategoriesRepositoryImpl(categoriesService);
  @injectable
  ProductsRepository get productsRepository => ProductsRepositoryImpl(productsService);
  @injectable
  ShoppingBagRepository get shoppingBagRepository => ShoppingBagRepositoryImpl(sharedPref, productsService);

  @injectable
  ClienteRepository get clienteRepository => ClienteRepositoryImpl(clienteService);

// **Nuevo: Repositorio de Ventas**
  @injectable
  VentaRepository get ventaRepository => VentaRepositoryImpl(ventasService);
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
        login: LoginUseCase(authRepository),
        register: RegisterUseCase(authRepository),
        saveUserSession: SaveUserSessionUseCase(authRepository),
        getUserSession: GetUserSessionUseCase(authRepository),
        logout: LogoutUseCase(authRepository),
      );

  // Nuevo: Repositorio de Reportes
  @injectable
  ReportesRepository get reportesRepository => ReportesRepositoryImpl(reportesService);

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
        getTotal: GetTotalShoppingBagUseCase(shoppingBagRepository),
        getClients: GetClientesUseCase(clienteRepository), // Aquí inicializas el nuevo caso de uso
        updateProductStock: UpdateProductStockUseCase(productsRepository), // Añade aquí
      );

  @injectable
  VentasUseCases get ventasUseCases => VentasUseCases(
        createVenta: CreateVentaUseCase(ventaRepository),
        getVentas: GetVentasUseCase(ventaRepository),
        deleteVenta: DeleteVentaUseCase(ventaRepository),
        getClienteById: GetClienteByIdUseCase(clienteRepository),
      );

  @injectable
  ClientesUseCases get clientesUseCases => ClientesUseCases(
        create: CreateClienteUseCase(clienteRepository),
        getClientes: GetClientesUseCase(clienteRepository),
        update: UpdateClienteUseCase(clienteRepository),
        delete: DeleteClienteUseCase(clienteRepository),
        getClienteById: GetClienteByIdUseCase(clienteRepository),
      );

  // Nuevo: Casos de uso de reportes
  @injectable
  ReportesUseCases get reportesUseCases => ReportesUseCases(
        getReporteClientes: GetReporteClientesUseCase(reportesRepository),
        getReporteProductos: GetReporteProductosUseCase(reportesRepository),
        getReporteVentas: GetReporteVentasUseCase(reportesRepository),
        getReporteInventario: GetReporteInventarioUseCase(reportesRepository),
        getProductosMasVendidos: GetProductosMasVendidosUseCase(reportesRepository),
        getVentasPorCliente: GetVentasPorClienteUseCase(reportesRepository),
        getVentasPorFecha: GetVentasPorFechaUseCase(reportesRepository),
        getProforma: GetProformaUseCase(reportesRepository),
      );
}
