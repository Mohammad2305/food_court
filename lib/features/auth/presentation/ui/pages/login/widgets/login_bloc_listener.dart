import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../cores/shared/routing/app_routes.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../manager/login/login_cubit.dart';
import 'login_form.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: AppColors.welcomeColor,
              ),
            ),
          );
        }
        else if (state is LoginSuccessful) {
          Navigator.pop(context); // close loading
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.layoutScreen, (_)=>false);
        }
        else if (state is LoginError) {
          Navigator.pop(context); // close loading
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: Icon(
                  Icons.error_outline_outlined,
                  color: AppColors.welcomeColor,
                ),
                title: Text(
                  "Error",
                  style: AppTextStyles.textFtS20FW500,
                ),
                content: Text(
                  state.error,
                  style: AppTextStyles.textFtS14FW300,
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        }
      },
      child: const LoginForm(),
    );
  }
}
