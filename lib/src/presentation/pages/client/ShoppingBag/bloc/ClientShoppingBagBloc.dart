import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Cliente.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/Venta.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ventas/VentasUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientShoppingBagBloc extends Bloc<ClientShoppingBagEvent, ClientShoppingBagState> {
  ShoppingBagUseCases shoppingBagUseCases;
  final VentasUseCases ventasUseCases; // Añade esta dependencia

  ClientShoppingBagBloc(
    this.shoppingBagUseCases,
    this.ventasUseCases,
  ) : super(ClientShoppingBagState()) {
    on<GetShoppingBag>(_onGetShoppingBag);
    on<AddItem>(_onAddItem);
    on<SubtractItem>(_onSubtractItem);
    on<RemoveItem>(_onRemoveItem);
    on<GetTotal>(_onGetTotal);
    on<GetClients>(_onGetClients);
    on<SelectClient>(_onSelectClient);
    on<CreateVenta>(_onCreateVenta);
  }

  Future<void> _onGetClients(GetClients event, Emitter<ClientShoppingBagState> emit) async {
    try {
      // Obtén el recurso
      final resource = await shoppingBagUseCases.getClients.run();

      // Verifica si el recurso contiene datos válidos
      if (resource is Success<List<Cliente>>) {
        emit(state.copyWith(clients: resource.data)); // Asigna la lista de clientes
      } else if (resource is Error) {
        print("Error: ${resource.message}");
      }
    } catch (error) {
      print("Error al obtener clientes: $error");
    }
  }

  Future<void> _onSelectClient(SelectClient event, Emitter<ClientShoppingBagState> emit) async {
    emit(state.copyWith(selectedClient: event.selectedClient));
  }

  Future<void> _onGetShoppingBag(GetShoppingBag event, Emitter<ClientShoppingBagState> emit) async {
    List<Product> products = await shoppingBagUseCases.getProducts.run();
    emit(state.copyWith(products: products));
    add(GetTotal());
  }

  Future<void> _onAddItem(AddItem event, Emitter<ClientShoppingBagState> emit) async {
    try {
      if (event.product.quantity! >= event.product.stock) {
        emit(state.copyWith(errorMessage: "Stock insuficiente para el producto: ${event.product.nombre}"));
        return;
      }

      event.product.quantity = event.product.quantity! + 1;
      await shoppingBagUseCases.add.run(event.product);
      add(GetShoppingBag());
    } catch (error) {
      emit(state.copyWith(errorMessage: "Error al agregar producto: $error"));
    }
  }

  Future<void> _onSubtractItem(SubtractItem event, Emitter<ClientShoppingBagState> emit) async {
    if (event.product.quantity! > 1) {
      event.product.quantity = event.product.quantity! - 1;
      await shoppingBagUseCases.add.run(event.product);
      add(GetShoppingBag());
    }
  }

  Future<void> _onRemoveItem(RemoveItem event, Emitter<ClientShoppingBagState> emit) async {
    await shoppingBagUseCases.deleteItem.run(event.product);
    add(GetShoppingBag());
  }

  Future<void> _onGetTotal(GetTotal event, Emitter<ClientShoppingBagState> emit) async {
    double total = await shoppingBagUseCases.getTotal.run();
    emit(state.copyWith(total: total));
  }

  Future<void> _onCreateVenta(CreateVenta event, Emitter<ClientShoppingBagState> emit) async {
    try {
      // Verifica que haya un cliente seleccionado y productos en el carrito
      if (state.selectedClient == null || state.products.isEmpty) {
        throw Exception("Debe seleccionar un cliente y agregar productos");
      }

      // Crea el objeto Venta
      final venta = Venta(
        idClient: state.selectedClient!.id!, // ID del cliente seleccionado
        products: state.products, // Lista de productos en el carrito
        total: state.total.toString(), // Total de la venta
        subtotal: (state.total * 0.9).toString(), // Subtotal (ejemplo: 90% del total)
      );

      // Llama al caso de uso para crear la venta
      await ventasUseCases.createVenta.run(venta);

      // Actualiza el stock de cada producto
      for (final product in state.products) {
        final newStock = product.stock - product.quantity!;
        await shoppingBagUseCases.updateProductStock.run(product.id!, newStock); // Usa tu caso de uso
      }

      // Limpia el carrito persistente
      await shoppingBagUseCases.deleteShoppingBag.run();

      // Limpia el estado del Bloc después de crear la venta
      emit(state.copyWith(products: [], total: 0, selectedClient: null));
    } catch (error) {
      emit(state.copyWith(errorMessage: "Error al confirmar la venta: $error"));
    }
  }
}
