import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';
import 'package:food_court/features/layout/presentation/ui/layouts/home/widgets/recommends/recommends_item_info.dart';
import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';

class RecommendGridList extends StatelessWidget {
  final List<ProductModel>? products;

  const RecommendGridList({super.key, this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products?.length ?? 6,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 140.h,
        crossAxisSpacing: 9.w,
        mainAxisSpacing: 9.h,
      ),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              decoration: AppBoxDecoration.welcomeButton(AppColors.splashColor),
              width: 159.w,
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                products?[index].productImage ?? AppAssets.imageSample,
                fit: BoxFit.cover,
              ),
            ),
            RecommendsItemInfo(productModel: products?[index],),
          ],
        );
      },
    );
  }
}
