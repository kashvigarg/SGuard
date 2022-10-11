import 'dart:async';
import 'dart:collection';
import 'package:empowering_humanity/view/dashboard/user_dashboard.dart';
import 'package:empowering_humanity/api/live_location/map_page.dart';
import 'package:empowering_humanity/api/live_streams/live_stream_view.dart';
import 'package:empowering_humanity/api/live_streams/signalling.dart';
import 'package:empowering_humanity/view/login/login_as.dart';
import 'package:empowering_humanity/view/login/view/home_page.dart';
import 'package:empowering_humanity/view/map_view.dart';
import 'package:empowering_humanity/view/registration/profile_setup.dart';
import 'package:empowering_humanity/view/registration/profile_setup_2.dart';
import 'package:empowering_humanity/view/registration/registration_form.dart';
import 'package:flutter/material.dart';

import '../login/view/login_page.dart';
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
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => UserDashboard())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(121, 125, 140, 0.76),
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}
