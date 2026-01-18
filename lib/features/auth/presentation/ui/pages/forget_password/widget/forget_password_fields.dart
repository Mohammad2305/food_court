import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_court/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../../../cores/shared/ui/widgets/custom_input.dart';

class ForgetPasswordFields extends StatelessWidget {
  const ForgetPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      inputTitle: "Email",
      hintText: "example@example.com",
      keyboardType: TextInputType.emailAddress,
      inputController: context.read<ResetPasswordCubit>().email,
      validator: FormBuilderValidators.email(),
    );
  }
}
