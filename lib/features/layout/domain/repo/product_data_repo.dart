import '../../data/models/product_model.dart';

abstract class ProductDataRepo {
  Future<List<ProductModel>> bestSellerProductsData();

  Future<List<ProductModel>> recommendProductsData();
}