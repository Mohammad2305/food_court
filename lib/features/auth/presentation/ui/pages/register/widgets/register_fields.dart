import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/features/auth/presentation/ui/pages/register/widgets/date_choose_icon.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_input.dart';
import '../../../../manager/register/register_cubit.dart';
import '../../../widgets/password_input.dart';

class RegisterFields extends StatelessWidget {
  const RegisterFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        // name field
        CustomInput(
          inputTitle: "Full name",
          hintText: "Full name",
          keyboardType: TextInputType.name,
          inputController: context.read<RegisterCubit>().name,
          validator: FormBuilderValidators.required(),
        ),
        // password field
        PasswordInput(
          inputController: context.read<RegisterCubit>().password,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.password(),
            FormBuilderValidators.required()
          ]),
        ),
        // email field
        CustomInput(
          inputTitle: "Email",
          hintText: "example@example.com",
          keyboardType: TextInputType.emailAddress,
          inputController: context.read<RegisterCubit>().email,
          validator: FormBuilderValidators.email(),
        ),
        // mobile number field
        CustomInput(
          inputTitle: "Mobile Number",
          hintText: "+ 123 456 789",
          keyboardType: TextInputType.phone,
          inputController: context.read<RegisterCubit>().mobile,
          validator: FormBuilderValidators.phoneNumber(),
        ),
        // birth field
        CustomInput(
          inputTitle: "Date of birth",
          hintText: "DD/MM/YYYY",
          readOnly: true,
          suffixIcon: DateChooseIcon(),
          inputController: context.read<RegisterCubit>().date,
          validator: FormBuilderValidators.required(),
        ),
      ],
    );
  }
}
