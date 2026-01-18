import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../../../cores/utils/functions/dates.dart';
import '../../../../manager/register/register_cubit.dart';

class DateChooseIcon extends StatelessWidget {
  const DateChooseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final date = await showDatePicker(
          context: context,
          firstDate: DateTime(DateTime.now().year - 200),
          lastDate: DateTime(DateTime.now().year),
        );
        if(context.mounted) {
          context.read<RegisterCubit>().date.text =
              AppDates.customDateForm(date??DateTime.now());
        }
      },
      icon: Icon(
        Icons.date_range_rounded,
        color: AppColors.welcomeColor,
      ),
    );
  }
}
