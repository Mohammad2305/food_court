import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());


  int? value = 0;
  void changeValue(int selectedValue){
    value = selectedValue;
    emit(ProductDetailsValueState());
  }
}
