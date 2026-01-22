import 'package:flutter/material.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import 'package:food_court/features/layout/presentation/ui/layouts/home/widgets/recommends/recommends_bloc_builder.dart';
import '../../../../../../../../../cores/shared/themes/app_text_styles.dart';

class RecommendList extends StatelessWidget {
  const RecommendList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "recommend".firstCharacterUpper,
          style: AppTextStyles.textFtS20FW500,
        ),
        RecommendsBlocBuilder(),
      ],
    );
  }
}
