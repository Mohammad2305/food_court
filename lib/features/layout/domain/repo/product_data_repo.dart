import '../../data/models/product_model.dart';

abstract class ProductDataRepo {
  Future<List<ProductModel>> bestSellerProductsData({required int count});

  Future<List<ProductModel>> recommendProductsData();

  Future<List<ProductModel>> discountProductsData();
}