import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/AdminProductAddSNBloc.dart';
import 'bloc/AdminProductAddSNEvent.dart';
import 'AdminProductAddSNContent.dart';

class AdminProductAddSNPage extends StatelessWidget {
  const AdminProductAddSNPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene el producto desde los argumentos de la ruta
    final product = ModalRoute.of(context)?.settings.arguments;

    if (product == null || !(product is Map) || !product.containsKey('codEAN')) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(child: Text('No se pudo obtener el producto')),
      );
    }

    final String codEAN = product['codEAN'] as String;

    return BlocProvider(
      create: (_) => AdminProductAddSNBloc()..add(LoadProductEvent(codEAN: codEAN)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Agregar SN al Producto'),
        ),
        body: const AdminProductAddSNContent(),
      ),
    );
  }
}
