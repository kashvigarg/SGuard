import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BgMain extends StatelessWidget {
  const BgMain({super.key, this.widget});

  final Widget? widget;
  final String imagePath = "assets/main_bg.png";
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(child: widget)
      ],
    );
  }
}
