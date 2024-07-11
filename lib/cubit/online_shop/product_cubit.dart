import 'package:bloc/bloc.dart';
import 'package:very_simple_online_shop_cubit/cubit/online_shop/product_state.dart';
import 'package:very_simple_online_shop_cubit/data/models/product.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(InitialState());

  final List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> getProducts() async {
    try {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(LoadedState(products: _products));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }

  Future<void> addProduct({
    required String title,
    required String imageUrl,
  }) async {
    try {
      final Product product = Product(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: title,
        imageUrl: imageUrl,
      );

      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 2));

      _products.add(product);
      emit(LoadedState(products: _products));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }

  Future<void> editProduct({
    required String id,
    required String title,
    required String imageUrl,
  }) async {
    try {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 2));

      int index = _products.indexWhere((element) => element.id == id);
      _products[index].title = title;
      _products[index].imageUrl = imageUrl;

      emit(LoadedState(products: _products));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }

  void toggleFavorite({required String id}) {
    int index = _products.indexWhere((element) => element.id == id);
    _products[index].isFavorite = !_products[index].isFavorite;
    emit(LoadedState(products: _products));
  }

  void removeProduct({required String id}) {
    int index = _products.indexWhere((element) => element.id == id);
    _products.removeAt(index);
    emit(LoadedState(products: _products));
  }
}
