import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/features/best_seller/presentation/ui/widgets/best_seller_container.dart';
import '../../../../layout/data/models/product_model.dart';

class BestSellerGridview extends StatelessWidget {
  final List<ProductModel>? products;

  const BestSellerGridview({super.key, this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 200.h,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.productScreen, arguments: products?[index]);
          },
          child: BestSellerContainer(product: products?[index]),
        );
      },
      itemCount: products?.length,
    );
  }
}
