import 'package:flutter/material.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import 'package:food_court/features/cart/presentation/ui/widgets/cart_bloc_builder.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.welcomeColor,
      body: CartBlocBuilder(),
    );
  }
}
