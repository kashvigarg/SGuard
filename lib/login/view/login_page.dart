import 'package:empowering_humanity/common_widgets/background_main.dart';
import 'package:empowering_humanity/common_widgets/banner.dart';
import 'package:empowering_humanity/common_widgets/base_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceInfo = MediaQuery.of(context);
    final screenHeight = deviceInfo.size.height;
    final screenWidth = deviceInfo.size.width;

    return MediaQuery(
        data: MediaQueryData(),
        child: Scaffold(
          body: BgMain(
            widget: BaseContainer(
              color: Color.fromRGBO(122, 159, 116, 0.8),
              height: screenHeight * 0.50,
              width: screenWidth * 0.8,
              curveRadius: 40,
              widget: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    BannerBody(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
