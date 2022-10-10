import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/banner.dart';
import 'package:empowering_humanity/constants/common_widgets/base_container.dart';
import 'package:empowering_humanity/constants/common_widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final deviceInfo = MediaQuery.of(context);
    final screenHeight = deviceInfo.size.height;
    final screenWidth = deviceInfo.size.width;

    return MediaQuery(
        data: MediaQueryData(),
        child: Scaffold(
          body: BgMain(
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BaseContainer(
                  height: screenHeight * 0.50,
                  width: screenWidth * 0.8,
                  curveRadius: 40,
                  widget: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        BannerBody(
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.7,
                        ),
                        Form(
                            child: Column(
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  constraints: BoxConstraints(
                                      minHeight: 30, maxWidth: 286),
                                  labelText: "Email",
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  constraints: BoxConstraints(
                                      minHeight: 30, maxWidth: 286),
                                  labelText: "Password",
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  constraints: BoxConstraints(
                                      minHeight: 30, maxWidth: 286),
                                  labelText: "Re-Enter Password",
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            AppButton(
                                pressedFunc: () {},
                                buttonColor: Color.fromRGBO(66, 139, 202, 1),
                                buttonText: "SIGN UP",
                                textColor: Colors.white,
                                height: screenHeight * 0.05,
                                width: screenWidth * 0.3)
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppButton(
                        icon: Icons.local_hospital_sharp,
                        pressedFunc: () {},
                        buttonColor: Colors.white,
                        buttonText: "Nearby Hospital",
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.48),
                    SizedBox(
                      height: screenHeight * 0.022,
                    ),
                    AppButton(
                        icon: Icons.call,
                        pressedFunc: () {},
                        buttonColor: Colors.white,
                        buttonText: "Call 100",
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.48)
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
