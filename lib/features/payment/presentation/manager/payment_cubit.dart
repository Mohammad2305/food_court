import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  int value = 0;
  void changeValue(int selectedValue){
    value = selectedValue;
    emit(SelectDifferentValueState());
  }
}
