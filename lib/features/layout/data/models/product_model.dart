class ProductModel {
  final String productName;
  final String productCategory;
  final String productImage;
  final double productPrice;
  final double productStars;
  final int productOrdersNumbers;
  final double productDiscount;
  final String productDescription;
  final List<String> chooses;

  ProductModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productCategory,
    required this.productStars,
    required this.productOrdersNumbers,
    required this.productDiscount,
    required this.productDescription, required this.chooses,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['product_name'] as String? ?? '',
      productImage: json['product_image'] as String? ?? '',
      productCategory: json['product_category'] as String? ?? '',
      productPrice: (json['product_price'] as num?)?.toDouble() ?? 0.0,
      productStars: (json['product_stars'] as num?)?.toDouble() ?? 0.0,
      productOrdersNumbers:
      (json['product_orders_numbers'] as num?)?.toInt() ?? 0,
      productDiscount:
      (json['product_discount'] as num?)?.toDouble() ?? 0.0,
      productDescription:
      json['product_description'] as String? ?? '',
      chooses: List<String>.from(json['chooses'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product_name": productName,
      "product_image": productImage,
      "product_price": productPrice,
      "product_category": productCategory,
      "product_stars": productStars,
      "product_orders_numbers": productOrdersNumbers,
      "product_discount": productDiscount,
      "product_description": productDescription,
      "chooses": chooses,
    };
  }
}

