import 'package:flutter/material.dart';
import '../../../data/consts/profile_details.dart';
import 'settings_button.dart';

class ProfileDetailsListview extends StatelessWidget {
  const ProfileDetailsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: profileDetails(context).length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index){
          return SettingsButton(
            profileDetailModel: profileDetails(context)[index],
          );
        },
        separatorBuilder: (context, index)=>Divider(),
      ),
    );
  }
}
