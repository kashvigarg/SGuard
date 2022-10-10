import 'package:flutter/material.dart';

import '../../constants/common_widgets/background_main.dart';
import '../../constants/common_widgets/base_container.dart';
import '../../constants/common_widgets/profile_photo.dart';
import '../../constants/common_widgets/text_button.dart';

class SignAs extends StatelessWidget {
  const SignAs({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceInfo = MediaQuery.of(context);
    final screenHeight = deviceInfo.size.height;
    final screenWidth = deviceInfo.size.width;

    return Scaffold(
      body: BgMain(
        widget: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: BaseContainer(
                color: Color.fromRGBO(121, 125, 140, 0.76),
                height: screenHeight * 0.15,
                width: screenWidth * 0.5,
                widget: Center(
                  child: Text(
                    "WELCOME \nTO \nS-GUARD",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                "STAY ALERT\nSAVE LIVES!",
                style: TextStyle(color: Colors.white, fontSize: 29),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(33.0),
                  child: Column(
                    children: [
                      AppButton(
                          pressedFunc: () {},
                          buttonColor: Colors.white,
                          buttonText: "SIGN-UP AS",
                          height: 51,
                          width: 267),
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: ProfileBanner(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Login to the app and save your personal details to better the experience in case of emergency.",
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                alignment: Alignment.bottomCenter,
                height: screenHeight * 0.4,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color.fromRGBO(121, 125, 140, 0.76),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
