import 'package:flutter/material.dart';

extension WidgetPadding on Widget {
  Widget get centering => Center(child: this,);

  Widget get topAligning => Align(alignment: Alignment.topCenter, child: this,);

  Widget get leftAligning => Align(alignment: Alignment.topLeft, child: this,);

  Widget get rightAligning => Align(alignment: Alignment.topRight, child: this,);

  Widget get bottomAligning => Align(alignment: Alignment.bottomCenter, child: this,);
}