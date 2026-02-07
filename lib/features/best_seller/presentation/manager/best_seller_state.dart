part of 'best_seller_cubit.dart';

@immutable
sealed class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}

class BestSellerLoading extends BestSellerState {}

class BestSellerSuccessful extends BestSellerState {
  final List<ProductModel> bestSeller;

  BestSellerSuccessful({
    required this.bestSeller,
  });
}

class BestSellerError extends BestSellerState {
  final String message;
  BestSellerError(this.message);
}