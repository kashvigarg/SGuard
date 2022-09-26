import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'base_container.dart';

class BannerBody extends StatelessWidget {
  const BannerBody(
      {super.key,
      required this.color,
      required this.height,
      required this.width});

  final Color color;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      color: color,
      height: height,
      width: width,
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  child: Image.asset("assets/circle_logo.png"),
                ),
                Text(
                  "S-Guard",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                  ),
                ),
                Image.asset("assets/extras/ambulance.png")
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("An Empowering Humanity NGO Inititative")
          ],
        ),
      ),
    );
  }
}
