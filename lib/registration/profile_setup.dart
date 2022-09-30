import 'package:empowering_humanity/common_widgets/background_main.dart';
import 'package:empowering_humanity/common_widgets/banner.dart';
import 'package:empowering_humanity/common_widgets/base_container.dart';
import 'package:empowering_humanity/common_widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileSetUp extends StatefulWidget {
  const ProfileSetUp({super.key});

  @override
  State<ProfileSetUp> createState() => _ProfileSetUpState();
}

class _ProfileSetUpState extends State<ProfileSetUp> {
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
                  height: screenHeight * 0.70,
                  width: screenWidth * 0.8,
                  curveRadius: 40,
                  widget: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: screenWidth * 0.09,
                              ),
                              Text(
                                "Profile Set Up",
                                textAlign: TextAlign.center,
                                textScaleFactor: 2,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Text(
                            "The app is focused on your personal medical testomony incase of emergency. Your doctor can find your personal information from the data you enter below:",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          Form(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 48,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    constraints: BoxConstraints(
                                        minHeight: 30, maxWidth: 286),
                                    labelText: "Name",
                                    fillColor: Colors.white,
                                    filled: true),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    constraints: BoxConstraints(
                                        minHeight: 30, maxWidth: 286),
                                    labelText: "DOB",
                                    fillColor: Colors.white,
                                    filled: true),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          constraints: BoxConstraints(
                                              minHeight: 30, maxWidth: 145),
                                          labelText: "Sex",
                                          fillColor: Colors.white,
                                          filled: true),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          constraints: BoxConstraints(
                                              minHeight: 30, maxWidth: 145),
                                          labelText: "Blood Type",
                                          fillColor: Colors.white,
                                          filled: true),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          constraints: BoxConstraints(
                                              minHeight: 30, maxWidth: 145),
                                          labelText: "Height",
                                          fillColor: Colors.white,
                                          filled: true),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          constraints: BoxConstraints(
                                              minHeight: 30, maxWidth: 145),
                                          labelText: "Weight",
                                          fillColor: Colors.white,
                                          filled: true),
                                    ),
                                  ],
                                ),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.06,
                              ),
                              AppButton(
                                  pressedFunc: () {},
                                  buttonColor: Color.fromARGB(255, 39, 142, 42),
                                  buttonText: "NEXT",
                                  icon: Icons.skip_next,
                                  textColor: Colors.white,
                                  height: screenHeight * 0.05,
                                  width: screenWidth * 0.3)
                            ],
                          ))
                        ],
                      ),
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
