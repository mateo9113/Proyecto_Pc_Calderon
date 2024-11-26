import 'package:app_proyecto_pccalderon/src/domain/models/Product.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/product/detail/bloc/ClientProductDetailEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/product/detail/bloc/ClientProductDetailState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientProductDetailBloc extends Bloc<ClientProductDetailEvent, ClientProductDetailState> {
  ShoppingBagUseCases shoppingBagUseCases;

  ClientProductDetailBloc(this.shoppingBagUseCases) : super(ClientProductDetailState()) {
    on<GetProducts>(_onGetProducts);
    on<AddItem>(_onAddItem);
    on<SubtractItem>(_onSubtractItem);
    on<AddProductToShoppingBag>(_onAddProductToShoppingBag);
    on<ResetState>(_onResetState);
    on<CheckProductStock>(_onCheckProductStock);
  }

  Future<void> _onCheckProductStock(CheckProductStock event, Emitter<ClientProductDetailState> emit) async {
    if (event.product.stock <= 0) {
      emit(state.copyWith(errorMessage: "Producto agotado. No hay stock disponible."));
      return;
    }
    emit(state.copyWith(errorMessage: null)); // Limpia errores si hay stock
  }

  Future<void> _onGetProducts(GetProducts event, Emitter<ClientProductDetailState> emit) async {
    List<Product> products = await shoppingBagUseCases.getProducts.run();
    int index = products.indexWhere((p) => p.id == event.product.id);
    if (index != -1) {
      emit(state.copyWith(quantity: products[index].quantity, errorMessage: null));
    }
  }

  Future<void> _onAddItem(AddItem event, Emitter<ClientProductDetailState> emit) async {
    try {
      // Validar si la cantidad excede el stock
      if (state.quantity >= event.product.stock) {
        emit(state.copyWith(errorMessage: "Stock insuficiente. Solo quedan ${event.product.stock} unidades."));
        return;
      }

      // Incrementar la cantidad y limpiar mensajes de error previos
      emit(state.copyWith(
        quantity: state.quantity + 1,
        errorMessage: null,
      ));
    } catch (error) {
      emit(state.copyWith(errorMessage: "Error al incrementar la cantidad: $error"));
    }
  }

  Future<void> _onSubtractItem(SubtractItem event, Emitter<ClientProductDetailState> emit) async {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1, errorMessage: null));
    } else {
      emit(state.copyWith(errorMessage: "La cantidad no puede ser menor a 1."));
    }
  }

  Future<void> _onAddProductToShoppingBag(AddProductToShoppingBag event, Emitter<ClientProductDetailState> emit) async {
    try {
      // Validar si la cantidad es menor o igual a 0
      if (state.quantity <= 0) {
        emit(state.copyWith(errorMessage: "Debe seleccionar al menos 1 producto para agregar."));
        return;
      }

      // Validar si la cantidad excede el stock disponible
      if (state.quantity > event.product.stock) {
        emit(state.copyWith(errorMessage: "Stock insuficiente. Solo quedan ${event.product.stock} unidades."));
        return;
      }

      // Agregar el producto al carrito
      event.product.quantity = state.quantity;
      await shoppingBagUseCases.add.run(event.product);

      // Limpiar mensajes de error después de agregar correctamente
      emit(state.copyWith(errorMessage: null));
    } catch (error) {
      emit(state.copyWith(errorMessage: "Error al agregar el producto: $error"));
    }
  }

  Future<void> _onResetState(ResetState event, Emitter<ClientProductDetailState> emit) async {
    emit(state.copyWith(quantity: 0, errorMessage: null));
  }
}
