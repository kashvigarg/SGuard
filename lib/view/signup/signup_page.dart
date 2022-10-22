import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/banner.dart';
import 'package:empowering_humanity/constants/common_widgets/base_container.dart';
import 'package:empowering_humanity/constants/common_widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

import '../../resources/auth_methods.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name = "";
  String pass = "";
  String mail = "";

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {});

      await () => GoRouter.of(context).push('/user');
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceInfo = MediaQuery.of(context);
    final screenHeight = deviceInfo.size.height;
    final screenWidth = deviceInfo.size.width;

    return MediaQuery(
        data: MediaQueryData(),
        child: Scaffold(
          body: BgMain(
            widget: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BaseContainer(
                    height: screenHeight * 0.60,
                    width: screenWidth * 0.8,
                    curveRadius: 40,
                    widget: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          BannerBody(),
                          Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: screenHeight * 0.04,
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Email cannot be empty";
                                        }

                                        return null;
                                      },
                                      onChanged: (value) {
                                        mail = value;
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          constraints: BoxConstraints(
                                              minHeight: 30, maxWidth: 275),
                                          labelText: "Email",
                                          fillColor: Colors.white,
                                          filled: true),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        pass = value;
                                        setState(() {});
                                      },
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
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          constraints: BoxConstraints(
                                              minHeight: 30, maxWidth: 275),
                                          labelText: "Password",
                                          fillColor: Colors.white,
                                          filled: true),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      validator: (value) {
                                        if (value != pass) {
                                          return "Password unvalidated";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          constraints: BoxConstraints(
                                              minHeight: 30, maxWidth: 275),
                                          labelText: "Re-Enter Password",
                                          fillColor: Colors.white,
                                          filled: true),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.06,
                                    ),
                                    AppButton(
                                        pressedFunc: () async {
                                          String res = await AuthMethods()
                                              .signUpUser(
                                                  email: mail, password: pass);
                                          print(res);
                                          moveToHome(context);
                                        },
                                        buttonColor:
                                            Color.fromRGBO(66, 139, 202, 1),
                                        buttonText: "SIGN UP",
                                        textColor: Colors.white,
                                        height: screenHeight * 0.05,
                                        width: screenWidth * 0.3)
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
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
          ),
        ));
  }
}
