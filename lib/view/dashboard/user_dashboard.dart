import 'package:empowering_humanity/constants/app_logos.dart';
import 'package:empowering_humanity/constants/app_strings.dart';
import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/banner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:empowering_humanity/constants/common_widgets/drawer.dart';
import 'package:empowering_humanity/constants/common_widgets/text_button.dart';

import 'package:empowering_humanity/constants/size_config.dart';
import 'package:flutter/material.dart';

import '../../constants/common_widgets/dialog_box.dart';

class UserDashboard extends StatefulWidget {
  UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: const CustomDrawer(),
      body: BgMain(
          widget: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const BannerBody(),
          Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            height: SizeConfig.screenHeight * 0.40,
            width: SizeConfig.screenWidth * 0.7,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {},
                      onDoubleTap: () {},
                      child: Image.asset(AppLogos.sos)),
                  IconButton(
                    icon: const Icon(Icons.info),
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog()),
                    color: Colors.white,
                  ),
                ]),
          ),
          const AppButton(
              icon: Icons.call,
              pressedFunc: _makePhoneCall,
              buttonColor: Colors.white,
              buttonText: "Call Police",
              height: 70,
              width: 300),
          AppButton(
              icon: Icons.add_location,
              pressedFunc: () {},
              buttonColor: Colors.white,
              buttonText: "Ping Emergency Contacts",
              height: 70,
              width: 300)
        ],
      )),
    );
  }
}

// app work
_makePhoneCall() async {
  var url = Uri.parse("tel:9667964943");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
