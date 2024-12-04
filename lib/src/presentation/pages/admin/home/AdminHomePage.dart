import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/category/list/AdminCategoryListPage.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/home/bloc/AdminHomeState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/product/list/AdminProductListPage.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/admin/reportes/ReportesPage.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/roles/RolesPage.dart';
import 'package:app_proyecto_pccalderon/main.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  late AdminHomeBloc _bloc;

  // Lista de páginas que se cambiarán dependiendo del `pageIndex`.
  List<Widget> pageList = <Widget>[
    AdminCategoryListPage(),
    RolesPage(),
    ReportesPage(),
    ProfileInfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Obtener el BLoC
    _bloc = BlocProvider.of<AdminHomeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      drawer: BlocBuilder<AdminHomeBloc, AdminHomeState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  child: Text(
                    'Menú de Admin',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  title: Text('Categorias'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    // Cambiar la página a la lista de categorías
                    _bloc.add(AdminChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context); // Cerrar el drawer
                  },
                ),
                ListTile(
                  title: Text('Roles'),
                  selected: state.pageIndex == 1,
                  onTap: () {
                    // Cambiar la página a la lista de roles
                    _bloc.add(AdminChangeDrawerPage(pageIndex: 1));
                    Navigator.pop(context); // Cerrar el drawer
                  },
                ),
                ListTile(
                  title: Text('Reportes'),
                  selected: state.pageIndex == 2,
                  onTap: () {
                    // Cambiar la página a la de reportes
                    _bloc.add(AdminChangeDrawerPage(pageIndex: 2));
                    Navigator.pop(context); // Cerrar el drawer
                  },
                ),
                ListTile(
                  title: Text('Perfil de usuario'),
                  selected: state.pageIndex == 3,
                  onTap: () {
                    // Cambiar la página al perfil de usuario
                    _bloc.add(AdminChangeDrawerPage(pageIndex: 3));
                    Navigator.pop(context); // Cerrar el drawer
                  },
                ),
                ListTile(
                  title: Text('Cerrar Sesión'),
                  onTap: () {
                    // Cerrar sesión y redirigir al login
                    _bloc.add(AdminLogout());
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      body: BlocBuilder<AdminHomeBloc, AdminHomeState>(
        builder: (context, state) {
          // Renderizamos la página correspondiente dependiendo del `pageIndex`
          return pageList[state.pageIndex];
        },
      ),
    );
  }
}
