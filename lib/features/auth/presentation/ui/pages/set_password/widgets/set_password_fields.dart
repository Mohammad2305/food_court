import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../manager/reset_password/reset_password_cubit.dart';
import '../../../widgets/password_input.dart';

class SetPasswordFields extends StatelessWidget {
  const SetPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        PasswordInput(
          inputController: context.read<ResetPasswordCubit>().password,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.password(),
            FormBuilderValidators.required(),
          ]),
        ),
        PasswordInput(
          inputTitle: "Confirm",
          inputController: context.read<ResetPasswordCubit>().confirmPassword,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.password(),
            FormBuilderValidators.required(),
          ]),
        ),
      ],
    ).onlyPadding(bottom: 50.h);
  }
}
