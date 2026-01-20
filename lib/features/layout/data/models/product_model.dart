class ProductModel {
  final String productName;
  final String productCategory;
  final String productImage;
  final double productPrice;
  final double productStars;
  final int productOrdersNumbers;

  ProductModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productCategory,
    required this.productStars,
    required this.productOrdersNumbers,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json["product_name"] ?? "",
      productImage: json["product_image"] ?? "",
      productCategory: json["product_category"] ?? "",
      productPrice: (json["product_price"] as num?)?.toDouble() ?? 0.0,
      productStars: (json["product_stars"] as num?)?.toDouble() ?? 0.0,
      productOrdersNumbers:
      (json["product_orders_numbers"] as num?)?.toInt() ?? 0,
    );
  }
}
