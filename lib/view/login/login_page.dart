import 'package:empowering_humanity/constants/app_strings.dart';
import 'package:empowering_humanity/constants/common_widgets/app_button.dart';
import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/banner.dart';
import 'package:empowering_humanity/constants/common_widgets/base_container.dart';
import 'package:empowering_humanity/constants/size_config.dart';
import 'package:empowering_humanity/resources/auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resources/auth_methods.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _email, _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgMain(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BaseContainer(
              height: SizeConfig.screenHeight * 0.50,
              width: SizeConfig.screenWidth * 0.8,
              curveRadius: 40,
              widget: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    BannerBody(),
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
                            constraints:
                                BoxConstraints(minHeight: 30, maxWidth: 286),
                            labelText: "Email",
                            hintText: "Enter Email",
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              constraints:
                                  BoxConstraints(minHeight: 30, maxWidth: 286),
                              labelText: "Password",
                              fillColor: Colors.white,
                              filled: true),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.black87),
                            )),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.02,
                        ),
                        AppButton(
                            pressedFunc: () {
                              _loginUser(
                                  email: _email.text, pass: _password.text);
                            },
                            buttonColor: Color.fromRGBO(66, 139, 202, 1),
                            buttonText: "LOGIN",
                            textColor: Colors.white,
                            height: SizeConfig.screenHeight * 0.05,
                            width: SizeConfig.screenWidth * 0.3)
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
                    pressedFunc: () {
                      _nearbyHospital;
                    },
                    buttonColor: Colors.white,
                    buttonText: "Nearby Hospital",
                    height: SizeConfig.screenHeight * 0.06,
                    width: SizeConfig.screenWidth * 0.48),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.022,
                ),
                AppButton(
                    icon: Icons.call,
                    pressedFunc: () {
                      _makePhoneCall(num: AppStrings.police);
                    },
                    buttonColor: Colors.white,
                    buttonText: "Call 100",
                    height: SizeConfig.screenHeight * 0.06,
                    width: SizeConfig.screenWidth * 0.48)
              ],
            )
          ],
        ),
      ),
    );
  }
}

_loginUser({required String email, required String pass}) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: pass);
}

_nearbyHospital() async {}

_makePhoneCall({required String num}) async {
  var url = ("tel:$num");
  var finUrl = Uri.parse(url);
  if (await canLaunchUrl(finUrl)) {
    await launchUrl(finUrl);
  } else {
    throw 'Could not launch $url';
  }
}
