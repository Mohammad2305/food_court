import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../../../cores/utils/constants/app_assets.dart';

class ReviewStars extends StatefulWidget {
  final void Function(int reviewValue) onTap;

  const ReviewStars({super.key, required this.onTap});

  @override
  State<ReviewStars> createState() => _ReviewStarsState();
}

int starsNumber = 0;

class _ReviewStarsState extends State<ReviewStars> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              starsNumber = index + 1;
            });
            widget.onTap(starsNumber);
          },
          child: SvgPicture.asset(
            index < starsNumber
                ? AppAssets.filledStar
                : AppAssets.outlineStar,
            width: 35.w,
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 10.w),
      itemCount: 5,
    ).sized(vertical: 40.h).onlyPadding(bottom: 30.h);
  }
}
