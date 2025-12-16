import 'package:flutter/material.dart';

extension WidgetMainApp on Widget{
  Widget sized({double? vertical, double? horizontal}) => SizedBox(
    width: horizontal,
    height: vertical,
    child: this,
  );

  Widget get scrolling => SingleChildScrollView(
    child: this,
  );

  Widget get underLine => Container(
    decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            color: Colors.black38,
          ),
        )
    ),
    child: this,
  );

  Widget get outLine => Container(
    decoration: BoxDecoration(
        border: BoxBorder.fromBorderSide(BorderSide(
          color: Colors.black38,
        ))
    ),
    child: this,
  );
}