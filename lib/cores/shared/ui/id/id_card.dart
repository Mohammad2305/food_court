import 'package:flutter/material.dart';
import 'package:food_court/cores/shared/ui/id/back_face/id_back.dart';
import 'package:food_court/cores/shared/ui/id/front_face/id_front.dart';
import 'package:food_court/cores/shared/ui/widgets/flippable_card.dart';

class IdCard extends StatelessWidget {
  const IdCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FlippableCard(frontFace: IdFront(), backFace: IdBack());
  }
}
