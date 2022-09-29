import 'package:flutter/material.dart';

import 'base_container.dart';

class BannerBody extends StatelessWidget {
  const BannerBody({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    // final deviceInfo = MediaQuery.of(context);
    // final screenHeight = deviceInfo.size.height;
    // final screenWidth = deviceInfo.size.width;

    return BaseContainer(
      color: Color.fromRGBO(217, 212, 199, 0.8),
      height: height,
      // screenHeight * 0.1,
      width: width,
      // screenWidth * 0.7,
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
