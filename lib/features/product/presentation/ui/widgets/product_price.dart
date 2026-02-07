import 'package:flutter/material.dart';
import 'product_with_discount.dart';
import 'product_without_discount.dart';

class ProductPrice extends StatelessWidget {
  final double? productDiscount;
  final double? productPrice;

  const ProductPrice({super.key, this.productDiscount, this.productPrice});

  @override
  Widget build(BuildContext context) {
    return (productDiscount ?? 0) > 0
        ? ProductWithDiscount(
            productDiscount: productDiscount,
            productPrice: productPrice,
          )
        : ProductWithoutDiscount(productPrice: productPrice);
  }
}
