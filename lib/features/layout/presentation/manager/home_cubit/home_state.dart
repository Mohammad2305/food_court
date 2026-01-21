part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ProductsDataGetLoading extends HomeState {}

final class ProductsDataGetSuccessful extends HomeState {
  final List<ProductModel> productModel;
  ProductsDataGetSuccessful(this.productModel);
}

final class ProductsDataGetError extends HomeState {
  final String error;
  ProductsDataGetError(this.error);
}

final class RecommendsProductsDataGetLoading extends HomeState {}

final class RecommendsProductsDataGetSuccessful extends HomeState {
  final List<ProductModel> productModel;
  RecommendsProductsDataGetSuccessful(this.productModel);
}

final class RecommendsProductsDataGetError extends HomeState {
  final String error;
  RecommendsProductsDataGetError(this.error);
}