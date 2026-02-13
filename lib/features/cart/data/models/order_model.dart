import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';

class OrderModel {
  final ProductModel product;
  final int amount;
  final DateTime dateTime;

  OrderModel({required this.product, required this.amount, required this.dateTime});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      product: ProductModel.fromJson(
        json['product'] as Map<String, dynamic>,
      ),
      amount: json['amount'] as int? ?? 0,
      dateTime: (json['time'] as Timestamp).toDate()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      "amount": amount,
      "time" : Timestamp.fromDate(dateTime)
    };
  }
}