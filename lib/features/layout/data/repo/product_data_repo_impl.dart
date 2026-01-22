import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';
import 'package:food_court/features/layout/domain/repo/product_data_repo.dart';
import '../../../../cores/utils/constants/app_constants.dart';

class ProductDataRepoImpl extends ProductDataRepo {
  @override
  Future<List<ProductModel>> bestSellerProductsData() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection(AppConstants.foodMenuCollection)
        .get();

    final products = querySnapshot.docs.map((doc) {
      return ProductModel.fromJson(doc.data());
    }).toList();

    products.sort(
      (a, b) => b.productOrdersNumbers.compareTo(a.productOrdersNumbers),
    );

    for (var product in products) {
      if (kDebugMode) {
        print(
          "___________________________________________________________________",
        );
        print(product.productName);
        print(product.productCategory);
        print(product.productImage);
        print("${product.productPrice}\$");
        print(product.productStars);
        print(product.productOrdersNumbers);
        print(product.productDiscount);
        print(
          "___________________________________________________________________",
        );
      }
    }

    return products.sublist(0, 6);
  }

  @override
  Future<List<ProductModel>> recommendProductsData() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection(AppConstants.foodMenuCollection)
        .get();

    final products = querySnapshot.docs.map((doc) {
      return ProductModel.fromJson(doc.data());
    }).toList();

    products.sort((a, b) => b.productStars.compareTo(a.productStars));

    for (var product in products) {
      if(kDebugMode){
        print(
          "___________________________________________________________________",
        );
        print(product.productName);
        print(product.productCategory);
        print(product.productImage);
        print("${product.productPrice}\$");
        print(product.productStars);
        print(product.productOrdersNumbers);
        print(product.productDiscount);
        print(
          "___________________________________________________________________",
        );
      }
    }

    return products.sublist(0, 6);
  }

  @override
  Future<List<ProductModel>> discountProductsData() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection(AppConstants.foodMenuCollection)
        .get();

    final products = querySnapshot.docs.map((doc) {
      return ProductModel.fromJson(doc.data());
    }).toList();

    products.sort((a, b) => b.productDiscount.compareTo(a.productDiscount));

    for (var product in products) {
      if(kDebugMode){
        print(
          "___________________________________________________________________",
        );
        print(product.productName);
        print(product.productCategory);
        print(product.productImage);
        print("${product.productPrice}\$");
        print(product.productStars);
        print(product.productOrdersNumbers);
        print(product.productDiscount);
        print(
          "___________________________________________________________________",
        );
      }
    }

    return products.where((product){
      return product.productDiscount>0;
    }).toList();
  }
}
