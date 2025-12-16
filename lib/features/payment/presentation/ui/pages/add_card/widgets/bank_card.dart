import 'package:flutter/material.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class BankCard extends StatelessWidget {
  const BankCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: "0000000000000000",
      expiryDate: "06/24",
      cardHolderName: "Mohammed",
      cvvCode: "0000",
      showBackView: true,
      onCreditCardWidgetChange: (CreditCardBrand brand) {},
      bankName: 'masr',
      cardBgColor: Colors.black87,
      glassmorphismConfig: Glassmorphism.defaultConfig(),
      enableFloatingCard: true,
      floatingConfig: FloatingConfig(
        shadowConfig: FloatingShadowConfig(),
      ),
      obscureCardNumber: true,
      obscureInitialCardNumber: false,
      obscureCardCvv: true,
      backgroundImage: AppAssets.card,
      labelCardHolder: 'CARD HOLDER',
      cardType: CardType.visa,
      isHolderNameVisible: false,
      height: 175,
      textStyle: TextStyle(color: Colors.yellowAccent),
      width: MediaQuery.of(context).size.width,
      isChipVisible: true,
      isSwipeGestureEnabled: true,
      animationDuration: Duration(milliseconds: 1000),
      frontCardBorder: Border.all(color: Colors.grey),
      backCardBorder: Border.all(color: Colors.grey),
      chipColor: Colors.red,
      padding: 0,
    );
  }
}
