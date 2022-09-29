import 'package:empowering_humanity/common_widgets/background_main.dart';
import 'package:empowering_humanity/common_widgets/banner.dart';
import 'package:empowering_humanity/common_widgets/base_container.dart';
import 'package:empowering_humanity/common_widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceInfo = MediaQuery.of(context);
    final screenHeight = deviceInfo.size.height;
    final screenWidth = deviceInfo.size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black38,
      ),
      body: BgMain(
          widget: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BannerBody(
            height: screenHeight * 0.1,
            width: screenWidth * 0.7,
          ),
          GestureDetector(
            onTap: () {},
            onDoubleTap: () {},
            child: Container(
                child: Image.asset("assets/sos.png"),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                height: screenHeight * 0.40,
                width: screenWidth * 0.7),
          ),
          AppButton(
              icon: Icons.call,
              pressedFunc: () {},
              buttonColor: Colors.white,
              buttonText: "Call Police",
              height: 70,
              width: 300),
          AppButton(
              icon: Icons.add_location,
              pressedFunc: () {},
              buttonColor: Colors.white,
              buttonText: "Ping Emergency Contacts",
              height: 70,
              width: 300)
        ],
      )),
    );
  }
}
