import 'package:flutter/material.dart';

class OrderStateModel{
  OrderStateModel({required this.state, required this.orderList});

  final String state;
  final Widget orderList;
}