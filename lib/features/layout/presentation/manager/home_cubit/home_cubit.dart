import 'package:bloc/bloc.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';
import 'package:food_court/features/layout/domain/repo/product_data_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ProductDataRepo productDataRepo;

  HomeCubit(this.productDataRepo) : super(HomeInitial());

  List<ProductModel> bestSeller = [];
  List<ProductModel> recommends = [];
  List<ProductModel> adsDiscounts = [];

  Future<void> loadData() async {
    emit(HomeLoading());

    try {
      bestSeller = await productDataRepo.bestSellerProductsData(count: 6);
      recommends = await productDataRepo.recommendProductsData();
      adsDiscounts = await productDataRepo.discountProductsData();

      emit(
        HomeSuccessful(
          bestSeller: bestSeller,
          recommends: recommends,
          adsDiscounts: adsDiscounts,
        ),
      );
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
