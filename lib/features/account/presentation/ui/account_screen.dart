import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/ui/widgets/general_app_bar.dart';
import 'package:food_court/cores/shared/ui/widgets/screen_layout.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/features/account/presentation/ui/widgets/edit_account_info_form.dart';
import 'package:food_court/features/profile/presentation/manager/profile_data_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.splashColor,
      resizeToAvoidBottomInset: false,
      appBar: GeneralAppBar(screenTitle: "My profile"),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          children: [
            BlocBuilder<ProfileDataCubit, ProfileDataState>(
              builder: (context, state) {
                if (state is ProfileDataLoading) {
                  return Skeletonizer(
                    effect: PulseEffect(
                        from: AppColors.splashColor,
                        to: AppColors.splashColor.withAlpha(100)
                    ),
                    child: EditAccountInfoForm(scaffoldKey: scaffoldKey,),
                  );
                }
                if (state is ProfileDataError) {
                  return Text(state.message, style: const TextStyle(color: Colors.red));
                }
                if (state is ProfileDataSuccessful) {
                  final user = state.user;
                  return EditAccountInfoForm(user: user, scaffoldKey: scaffoldKey,);
                }
                return const SizedBox();
              },
            )
          ],
        ).scrolling,
      ),
    );
  }
}
