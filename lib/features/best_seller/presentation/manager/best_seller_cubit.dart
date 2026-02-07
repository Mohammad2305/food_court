import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../layout/data/models/product_model.dart';
import '../../../layout/domain/repo/product_data_repo.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  ProductDataRepo productDataRepo;
  BestSellerCubit(this.productDataRepo) : super(BestSellerInitial());

  List<ProductModel> bestSeller = [];
  Future<void> loadBestSellerData() async {
    emit(BestSellerLoading());

    try {
      bestSeller = await productDataRepo.bestSellerProductsData(count: 20);

      emit(
        BestSellerSuccessful(
          bestSeller: bestSeller,
        ),
      );
    } catch (e) {
      emit(BestSellerError(e.toString()));
    }
  }
}
