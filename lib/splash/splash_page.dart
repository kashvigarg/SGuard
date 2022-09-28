import 'dart:async';
import 'package:empowering_humanity/dashboard/user_dashboard.dart';
import 'package:empowering_humanity/login/login_as.dart';
import 'package:empowering_humanity/login/view/home_page.dart';
import 'package:flutter/material.dart';

import '../login/view/login_page.dart';
import '../signup/sign_as.dart';

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
      backgroundColor: Color.fromRGBO(122, 159, 116, 0.8),
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}
