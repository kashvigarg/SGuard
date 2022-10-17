import 'dart:async';
import 'dart:collection';
import 'package:empowering_humanity/constants/size_config.dart';
import 'package:empowering_humanity/view/dashboard/user_dashboard.dart';
import 'package:empowering_humanity/api/live_location/map_page.dart';
import 'package:empowering_humanity/api/live_streams/live_stream_view.dart';
import 'package:empowering_humanity/api/live_streams/signalling.dart';
import 'package:empowering_humanity/view/login/login_as.dart';
import 'package:empowering_humanity/view/home_page.dart';
import 'package:empowering_humanity/view/registration/profile_setup.dart';
import 'package:empowering_humanity/view/registration/profile_setup_2.dart';
import 'package:empowering_humanity/view/registration/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../login/login_page.dart';
import '../signup/sign_as.dart';
import '../signup/signup_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => GoRouter.of(context).push('/main'));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: Color.fromRGBO(121, 125, 140, 0.76),
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}
