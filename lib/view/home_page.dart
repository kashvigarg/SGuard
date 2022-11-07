import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/banner.dart';
import 'package:empowering_humanity/constants/common_widgets/base_container.dart';
import 'package:empowering_humanity/constants/size_config.dart';
import 'package:empowering_humanity/view/dashboard/user_dashboard.dart';
import 'package:empowering_humanity/view/login/login_as.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/user_model.dart';

// welcome screen displayed if not logged in

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (_user != null) {
      //user is signed in already
      // GoRouter.of(context).push('/loginas');
      return LoginAs();
    } else {
      return Scaffold(
        body: BgMain(
          widget: Column(
            children: [
              const BannerBody(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              BaseContainer(
                widget: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        maxRadius: SizeConfig.screenHeight * 0.18,
                        child: Image.asset("assets/transp_logo.png"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "An Empowering Humanity NGO Initiative",
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
                height: SizeConfig.screenHeight * 0.50,
                width: SizeConfig.screenWidth * 0.8,
                curveRadius: 40,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => GoRouter.of(context).push('/loginas'),
                    child: BaseContainer(
                        color: const Color.fromRGBO(203, 183, 7, 0.76),
                        height: SizeConfig.screenHeight * 0.06,
                        width: SizeConfig.screenWidth * 0.30,
                        widget: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Log In",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.15,
                  ),
                  InkWell(
                    onTap: () => GoRouter.of(context).push('/signinas'),
                    child: BaseContainer(
                        color: const Color.fromRGBO(203, 183, 7, 0.76),
                        height: SizeConfig.screenHeight * 0.06,
                        width: SizeConfig.screenWidth * 0.30,
                        widget: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              )),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}
