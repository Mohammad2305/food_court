import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/features/best_seller/presentation/ui/widgets/product_category_price.dart';
import 'package:food_court/features/best_seller/presentation/ui/widgets/product_image.dart';
import 'package:food_court/features/best_seller/presentation/ui/widgets/product_name_stars.dart';
import 'package:food_court/features/layout/data/consts/food_categories.dart';
import '../../../../layout/data/models/product_model.dart';

class BestSellerContainer extends StatelessWidget {
  final ProductModel? product;
  const BestSellerContainer({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final categoryIndex = categories.indexWhere(
          (category) =>
      category.name == product?.productCategory,
    );

    if (categoryIndex == -1) {
      // category not found → handle safely
      return const SizedBox(); // or default widget
    }

    final categoryItem = categories[categoryIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Stack(
          children: [
            ProductImage(image: product?.productImage,),
            ProductCategoryPrice(product: product, categoryModel: categoryItem,)
          ],
        ),
        ProductNameStars(product: product,)
      ],
    );
  }
}
