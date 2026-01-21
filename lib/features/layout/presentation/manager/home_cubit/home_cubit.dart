import 'package:bloc/bloc.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';
import 'package:food_court/features/layout/domain/repo/product_data_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ProductDataRepo productDataRepo;
  HomeCubit(this.productDataRepo) : super(HomeInitial());

  Future<void> getBestSellerProducts() async{
    emit(ProductsDataGetLoading());
    try{
      final products = await productDataRepo.bestSellerProductsData();
      emit(ProductsDataGetSuccessful(products));
        }
    catch(e){
      emit(ProductsDataGetError(e.toString()));
    }
  }

  Future<void> getRecommendsProducts() async{
    emit(RecommendsProductsDataGetLoading());
    try{
      final products = await productDataRepo.recommendProductsData();
      emit(RecommendsProductsDataGetSuccessful(products));
    }
    catch(e){
      emit(RecommendsProductsDataGetError(e.toString()));
    }
  }
}
