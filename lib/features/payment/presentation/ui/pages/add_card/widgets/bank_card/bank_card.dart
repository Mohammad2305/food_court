import 'package:flutter/material.dart';
import 'package:food_court/cores/shared/ui/widgets/flippable_card.dart';
import 'package:food_court/features/payment/presentation/ui/pages/add_card/widgets/bank_card/back_face/bank_card_back.dart';
import 'package:food_court/features/payment/presentation/ui/pages/add_card/widgets/bank_card/front_face/bank_card_front.dart';

class BankCard extends StatelessWidget {
  const BankCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FlippableCard(
      frontFace: BankCardFront(),
      backFace: BankCardBack(),
    );
  }
}
