import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_input.dart';
import '../../../widgets/password_input.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        // email field
        CustomInput(
          inputTitle: "Email or Mobile Number",
          hintText: "example@example.com",
          keyboardType: TextInputType.emailAddress,
          inputController: context.read<LoginCubit>().email,
          validator: FormBuilderValidators.email(),
        ),
        // password field
        PasswordInput(
          inputController: context.read<LoginCubit>().password,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.password(),
            FormBuilderValidators.required()
          ]),
        ),
      ],
    );
  }
}
