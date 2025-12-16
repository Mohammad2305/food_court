import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  int currentIndex = 0;

  void changeIndex(int index){
    currentIndex = index;
    emit(ChangeIndexState());
  }

  int value = 0;
  void changeValue(int selectedValue){
    value = selectedValue;
    emit(SelectDifferentValueState());
  }
}
