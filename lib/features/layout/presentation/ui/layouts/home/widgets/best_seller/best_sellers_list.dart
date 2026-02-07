import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';
import 'package:food_court/features/layout/presentation/ui/layouts/home/widgets/best_seller/best_seller_item.dart';
import '../../../../../../../../cores/shared/routing/app_routes.dart';

class BestSellersList extends StatelessWidget {
  final List<ProductModel>? products;

  const BestSellersList({super.key, this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products?.length ?? 6,
      shrinkWrap: true,
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.productScreen, arguments: products?[index]);
          },
          child: BestSellerItem(productModel: products?[index]),
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 6.w),
    );
  }
}
