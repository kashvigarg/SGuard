import 'package:empowering_humanity/constants/app_strings.dart';
import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/banner.dart';
import 'package:empowering_humanity/constants/common_widgets/base_container.dart';
import 'package:empowering_humanity/constants/common_widgets/app_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/size_config.dart';
import '../../resources/auth_methods.dart';

// signup page
//TODO ROUTE TO REGISTRATION PAGE
// AFTER REGISTRATION USER DASHBOARD
// FROM DASHBOARD WE CAN DO PROFILE SETUP

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController _email, _pass;

  @override
  void initState() {
    _email = TextEditingController();
    _pass = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgMain(
        widget: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BaseContainer(
                height: SizeConfig.screenHeight * 0.60,
                width: SizeConfig.screenWidth * 0.8,
                curveRadius: 40,
                widget: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      const BannerBody(),
                      Form(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.04,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email cannot be empty";
                                }

                                return null;
                              },
                              controller: _email,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  constraints: const BoxConstraints(
                                      minHeight: 30, maxWidth: 275),
                                  labelText: "Email",
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _pass,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password cannot be empty";
                                } else if (value.length < 6) {
                                  return "Password must be atleast 6 characters long";
                                }

                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  constraints: const BoxConstraints(
                                      minHeight: 30, maxWidth: 275),
                                  labelText: "Password",
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // TextFormField(

                            //   validator: (value) {
                            //     if (value != pass) {
                            //       return "Password unvalidated";
                            //     }
                            //     return null;
                            //   },
                            //   decoration: InputDecoration(
                            //       border: OutlineInputBorder(
                            //           borderRadius:
                            //               BorderRadius.circular(6)),
                            //       constraints: const BoxConstraints(
                            //           minHeight: 30, maxWidth: 275),
                            //       labelText: "Re-Enter Password",
                            //       fillColor: Colors.white,
                            //       filled: true),
                            // ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.06,
                            ),
                            AppButton(
                                pressedFunc: () async {
                                  _signUpUser(
                                      email: _email.text, pass: _pass.text);
                                  String res = await AuthMethods().signUpUser(
                                      email: _email.text, password: _pass.text);
                                  print(res);

                                  if (res == "success") {
                                    GoRouter.of(context).push('/registration');
                                  }
                                },
                                buttonColor:
                                    const Color.fromRGBO(66, 139, 202, 1),
                                buttonText: "SIGN UP",
                                textColor: Colors.white,
                                height: SizeConfig.screenHeight * 0.05,
                                width: SizeConfig.screenWidth * 0.3)
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppButton(
                      icon: Icons.local_hospital_sharp,
                      pressedFunc: () {
                        _nearbyHospital();
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
      ),
    );
  }
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

_signUpUser({required String email, required String pass}) async {
  final UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: pass);
}
