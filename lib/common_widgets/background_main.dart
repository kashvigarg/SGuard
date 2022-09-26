import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class BgMain extends StatelessWidget {
  const BgMain(this.widget, {super.key, required this.imagePath});

  final Widget widget;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        child: widget,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imagePath), fit: BoxFit.cover)));
  }
}
