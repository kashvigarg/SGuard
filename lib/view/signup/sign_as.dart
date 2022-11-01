import 'package:empowering_humanity/constants/size_config.dart';
import 'package:flutter/material.dart';

import '../../constants/common_widgets/background_main.dart';
import '../../constants/common_widgets/base_container.dart';
import '../../constants/common_widgets/profile_photo.dart';
import '../../constants/common_widgets/app_button.dart';

// prompts the user to sign up as an admin, super admin or user

class SignAs extends StatelessWidget {
  const SignAs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgMain(
        widget: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: BaseContainer(
                height: SizeConfig.screenHeight * 0.15,
                width: SizeConfig.screenWidth * 0.5,
                widget: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "WELCOME \nTO \nS-GUARD",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            const Text(
              "STAY ALERT\nSAVE LIVES!",
              textScaleFactor: 1.9,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.07,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                height: SizeConfig.screenHeight * 0.4,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color.fromRGBO(121, 125, 140, 0.76),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                        buttonColor: Colors.white,
                        buttonText: "SIGN-UP AS",
                        height: SizeConfig.screenHeight * 0.06,
                        width: SizeConfig.screenWidth * 0.6),
                    const ProfileBanner(),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Sign up and save your personal details to better the experience in case of emergency.",
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
