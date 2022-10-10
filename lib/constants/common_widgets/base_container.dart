import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  BaseContainer({
    super.key,
    this.color,
    required this.height,
    required this.width,
    this.curveRadius,
    this.widget,
  });

  late double height;
  late double width;
  late double? curveRadius;
  late Widget? widget;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color == null ? Color.fromRGBO(121, 125, 140, 0.76) : color,
          borderRadius: BorderRadius.circular(curveRadius ?? 40)),
      child: widget,
    );
  }
}
