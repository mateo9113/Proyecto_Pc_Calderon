import 'package:app_proyecto_pccalderon/injection.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/cliente/ClientesUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/users/UsersUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/VentasUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/category/list/bloc/ClientCategoryListBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/create/bloc/ClienteCreateBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/list/bloc/ClienteListBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/update/bloc/ClienteUpdateBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/product/detail/bloc/ClientProductDetailBloc.dart';
// import 'package:app_proyecto_pccalderon/src/presentation/pages/client/product/detail/bloc/ClientProductDetailBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/product/list/bloc/ClientProductListBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/bloc/VentaListBloc.dart';

import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
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
  BlocProvider<ProfileUpdateBloc>(
      create: (context) => ProfileUpdateBloc(locator<UsersUseCases>(), locator<AuthUseCases>())),
  BlocProvider<AdminCategoryCreateBloc>(
      create: (context) => AdminCategoryCreateBloc(locator<CategoriesUseCases>())..add(AdminCategoryCreateInitEvent())),
  BlocProvider<AdminCategoryListBloc>(create: (context) => AdminCategoryListBloc(locator<CategoriesUseCases>())),
  BlocProvider<AdminCategoryUpdateBloc>(create: (context) => AdminCategoryUpdateBloc(locator<CategoriesUseCases>())),
  BlocProvider<AdminProductCreateBloc>(create: (context) => AdminProductCreateBloc(locator<ProductsUseCases>())),
  BlocProvider<AdminProductListBloc>(create: (context) => AdminProductListBloc(locator<ProductsUseCases>())),
  BlocProvider<AdminProductUpdateBloc>(create: (context) => AdminProductUpdateBloc(locator<ProductsUseCases>())),
  BlocProvider<ClientHomeBloc>(create: (context) => ClientHomeBloc(locator<AuthUseCases>())),
  BlocProvider<ClientCategoryListBloc>(create: (context) => ClientCategoryListBloc(locator<CategoriesUseCases>())),
  BlocProvider<ClientProductListBloc>(create: (context) => ClientProductListBloc(locator<ProductsUseCases>())),
  BlocProvider<ClientProductDetailBloc>(create: (context) => ClientProductDetailBloc(locator<ShoppingBagUseCases>())),
  BlocProvider<ClientShoppingBagBloc>(
      create: (context) => ClientShoppingBagBloc(
            locator<ShoppingBagUseCases>(),
            locator<VentasUseCases>(),
          )),
//cliente
  BlocProvider<ClienteListBloc>(create: (context) => ClienteListBloc(locator<ClientesUseCases>())),
  BlocProvider<ClienteUpdateBloc>(create: (context) => ClienteUpdateBloc(locator<ClientesUseCases>())),
  BlocProvider<ClienteCreateBloc>(create: (context) => ClienteCreateBloc(locator<ClientesUseCases>())),

// VENTAS
  BlocProvider<VentaListBloc>(create: (context) => VentaListBloc(locator<VentasUseCases>())),
];
