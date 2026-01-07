import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';


class FlippableCard extends StatelessWidget {
  final Widget frontFace;
  final Widget backFace;
  const FlippableCard({super.key, required this.frontFace, required this.backFace,});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      controller: FlipCardController(),
      disableSplashEffect: true,
      onTapFlipping: true,
      frontWidget: frontFace,
      backWidget: backFace,
      rotateSide: RotateSide.right,
    );
  }
}
