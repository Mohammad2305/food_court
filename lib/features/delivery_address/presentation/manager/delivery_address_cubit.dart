import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delivery_address_state.dart';

class DeliveryAddressCubit extends Cubit<DeliveryAddressState> {
  DeliveryAddressCubit() : super(DeliveryAddressInitial());

  int value = 0;
  void changeValue(int selectedValue){
    value = selectedValue;
    emit(SelectDifferentValueState());
  }
}
