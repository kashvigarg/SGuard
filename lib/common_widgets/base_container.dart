import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BaseContainer extends StatelessWidget {
  BaseContainer(this.curveRadius, this.widget,
      {super.key, required this.color});

  late double curveRadius = 40;
  late Widget widget;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(curveRadius)),
      child: widget,
    );
  }
}
