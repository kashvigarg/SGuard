import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/banner.dart';
import 'package:empowering_humanity/constants/common_widgets/base_container.dart';
import 'package:empowering_humanity/constants/common_widgets/text_button.dart';
import 'package:empowering_humanity/constants/common_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileSetUp2 extends StatefulWidget {
  const ProfileSetUp2({super.key});

  @override
  State<ProfileSetUp2> createState() => _ProfileSetUp2State();
}

class _ProfileSetUp2State extends State<ProfileSetUp2> {
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
                  height: screenHeight * 0.9,
                  width: screenWidth * 0.8,
                  curveRadius: 40,
                  widget: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
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
                                child: Column(children: [
                              SizedBox(
                                height: 48,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    constraints: BoxConstraints(
                                        minHeight: 30, maxWidth: 286),
                                    labelText: "Illness",
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
                                    labelText: "Allergy",
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
                                    labelText: "Chronic Condition",
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
                                    labelText: "Surgery",
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
                                    labelText: "Medication",
                                    fillColor: Colors.white,
                                    filled: true),
                              )
                            ])),
                            SizedBox(
                              height: screenHeight * 0.03,
                            ),
                            Text(
                              "LifeStyle Habits",
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            RadioListTile(
                                groupValue: false,
                                value: false,
                                onChanged: (value) {},
                                title: Text(
                                  "Smoking",
                                  style: TextStyle(color: Colors.white),
                                )),
                            RadioListTile(
                                groupValue: true,
                                value: false,
                                onChanged: (value) {},
                                title: Text("Drinking",
                                    style: TextStyle(color: Colors.white))),
                            SizedBox(
                              height: screenHeight * 0.03,
                            ),
                            Text(
                              "Emergency Contact Information",
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            DataField(labelData: "Name"),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            DataField(labelData: "Relation"),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            DataField(labelData: "Phone Number"),
                            SizedBox(
                              height: screenHeight * 0.06,
                            ),
                            AppButton(
                                pressedFunc: () {},
                                buttonColor: Color.fromARGB(255, 39, 142, 42),
                                buttonText: "FINISH",
                                icon: Icons.skip_next,
                                textColor: Colors.white,
                                height: screenHeight * 0.05,
                                width: screenWidth * 0.3)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
