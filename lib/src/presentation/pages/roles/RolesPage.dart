import 'package:app_proyecto_pccalderon/src/domain/models/Role.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/roles/RolesItem.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/roles/bloc/RolesBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/roles/bloc/RolesState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<RolesBloc, RolesState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 10, top: 15),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true,
            children: state.roles != null
                ? (state.roles?.map((Role? role) {
                    return role != null ? RolesItem(role) : Container();
                  }).toList()) as List<Widget>
                : [],
          ),
        );
      },
    ));
  }
}