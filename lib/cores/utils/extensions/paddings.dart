import 'package:flutter/material.dart';

extension WidgetPadding on Widget {
  Widget symmetricPadding({double? vertical, double? horizontal}) => Padding(
    padding: EdgeInsets.symmetric(
      vertical: vertical ?? 0,
      horizontal: horizontal ?? 0,
    ),
    child: this,
  );

  Widget allPadding({double? all}) =>
      Padding(padding: EdgeInsets.all(all ?? 0), child: this);

  Widget onlyPadding({
    double? right,
    double? left,
    double? top,
    double? bottom,
  }) => Padding(
    padding: EdgeInsets.only(
      right: right ?? 0,
      left: left ?? 0,
      top: top ?? 0,
      bottom: bottom ?? 0,
    ),
    child: this,
  );
}
