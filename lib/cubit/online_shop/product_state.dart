import 'package:very_simple_online_shop_cubit/data/models/product.dart';

sealed class ProductState {}

final class InitialState extends ProductState {}

final class LoadingState extends ProductState {}

final class LoadedState extends ProductState {
  List<Product> products;

  LoadedState({required this.products});
}

final class ErrorState extends ProductState {
  final String message;

  ErrorState({required this.message});
}
