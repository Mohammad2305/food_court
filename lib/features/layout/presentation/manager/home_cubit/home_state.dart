part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccessful extends HomeState {
  final List<ProductModel> bestSeller;
  final List<ProductModel> recommends;
  final List<ProductModel> adsDiscounts;

  HomeSuccessful({
    required this.bestSeller,
    required this.recommends,
    required this.adsDiscounts
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}