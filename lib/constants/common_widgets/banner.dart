import 'package:empowering_humanity/constants/app_strings.dart';
import 'package:empowering_humanity/constants/size_config.dart';
import 'package:flutter/material.dart';

import 'base_container.dart';

class BannerBody extends StatelessWidget {
  const BannerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      color: const Color.fromRGBO(217, 212, 199, 0.8),
      height: SizeConfig.screenHeight * 0.1,
      width: SizeConfig.screenWidth * 0.7,
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
                  AppStrings.appTitle,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                  ),
                ),
                Image.asset("assets/extras/ambulance.png")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "An Empowering Humanity NGO Inititative",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
