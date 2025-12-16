import 'package:flutter/material.dart';
import '../../../widgets/menu_head.dart';
import 'welcome_text.dart';

class HomeHead extends StatelessWidget {
  const HomeHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MenuHead(),
        WelcomeText()
      ],
    );
  }
}
