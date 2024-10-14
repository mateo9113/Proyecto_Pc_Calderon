import 'package:app_proyecto_pccalderon/injection.dart';
import 'package:app_proyecto_pccalderon/src/blocProviders.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/home/AdminHomePage.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/home/ClientHomePage.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/update/ProfileUpdatePage.dart';
// import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/roles/RolesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:rxdart/rxdart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder: FToastBuilder(),
        debugShowCheckedModeBanner: false,
        title: 'App Pc Calderon',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'roles': (BuildContext context) => RolesPage(),
          'profile/info': (BuildContext context) => ProfileInfoPage(),
          'profile/update': (BuildContext context) => ProfileUpdatePage(),
          'client/home': (BuildContext context) => ClientHomePage(),
          'admin/home': (BuildContext context) => AdminHomePage(),
          // 'admin/category/create': (BuildContext context) => AdminCategoryCreatePage(),
          // 'admin/category/update': (BuildContext context) => AdminCategoryUpdatePage(),
          // 'admin/product/list': (BuildContext context) => AdminProductListPage(),
          // 'admin/product/create': (BuildContext context) => AdminProductCreatePage(),
          // 'admin/product/update': (BuildContext context) => AdminProductUpdatePage(),
          // 'client/product/list': (BuildContext context) => ClientProductListPage(),
          // 'client/product/detail': (BuildContext context) => ClientProductDetailPage(),
          // 'client/shopping_bag': (BuildContext context) => ClientShoppingBagPage(),
          // 'client/address/list': (BuildContext context) => ClientAddressListPage(),
          // 'client/address/create': (BuildContext context) => ClientAddressCreatePage(),
          // 'client/payment/form': (BuildContext context) => ClientPaymentFormPage(),
          // 'client/payment/installments': (BuildContext context) => ClientPaymentInstallmentsPage(),
          // 'client/payment/status': (BuildContext context) => ClientPaymentStatusPage(),
          // 'admin/order/detail': (BuildContext context) => AdminOrderDetailPage(),
          // 'client/order/detail': (BuildContext context) => ClientOrderDetailPage(),
        }, //rutas
      ),
    );
  }
}
