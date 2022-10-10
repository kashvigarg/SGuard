import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/base_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceInfo = MediaQuery.of(context);
    final screenHeight = deviceInfo.size.height;
    final screenWidth = deviceInfo.size.width;
    return Scaffold(
      body: BgMain(
          widget: Column(
        children: [
          BaseContainer(
            color: Color.fromRGBO(250, 187, 130, 0.77),
            height: screenHeight * 0.1,
            width: screenWidth * 0.7,
          ),
          Row(
            children: [
              BaseContainer(
                color: Color.fromRGBO(250, 187, 130, 0.77),
                height: screenHeight * 0.1,
                width: screenWidth * 0.7,
              ),
              BaseContainer(
                color: Color.fromRGBO(250, 187, 130, 0.77),
                height: screenHeight * 0.1,
                width: screenWidth * 0.7,
              )
            ],
          )
        ],
      )),
    );
  }
}
