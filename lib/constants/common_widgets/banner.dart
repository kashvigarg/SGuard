import 'package:empowering_humanity/constants/app_logos.dart';
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
      height: SizeConfig.screenHeight * 0.12,
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
                  child: Image.asset(AppLogos.appLogo),
                ),
                Text(
                  AppStrings.appTitle,
                  textScaleFactor: 2,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
                Image.asset(AppLogos.ambulanceLogo)
              ],
            ),
            SizedBox.shrink(),
            Text(
              AppStrings.moto,
              textScaleFactor: 1,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
