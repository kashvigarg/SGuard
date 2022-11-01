import 'package:empowering_humanity/api/live_streams/signalling.dart';
import 'package:empowering_humanity/constants/app_logos.dart';
import 'package:empowering_humanity/constants/app_strings.dart';
import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/banner.dart';
import 'package:empowering_humanity/models/emergency_connect_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:empowering_humanity/constants/common_widgets/app_button.dart';
import 'package:empowering_humanity/constants/size_config.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    Signaling signaling = Signaling();
    RTCVideoRenderer _localRenderer = RTCVideoRenderer();
    RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
    String? roomId;
    TextEditingController textEditingController =
        TextEditingController(text: '');
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: _customDrawer(context),
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
                      onTap: () {
                        _pingEmergencyContacts();
                      },
                      onDoubleTap: () {
                        _connectRTC;
                        // signaling.openUserMedia(_localRenderer, _remoteRenderer);
                      },
                      child: Image.asset(AppLogos.sos)),
                  IconButton(
                    icon: const Icon(Icons.info),
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => _customDialog()),
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
          const AppButton(
              icon: Icons.add_location,
              pressedFunc: _pingEmergencyContacts,
              buttonColor: Colors.white,
              buttonText: "Ping Emergency Contacts",
              height: 70,
              width: 300)
        ],
      )),
    );
  }
}

// app functions

_makePhoneCall() async {
  var url = Uri.parse("tel:9667964943");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

// TODO : implement ping emergency contacts
_pingEmergencyContacts() async {}

_connectRTC() async {}

Widget _customDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.black45,
    elevation: 6,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              minRadius: 40,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Kashvi Garg",
              style: TextStyle(color: Colors.white),
            )
          ],
        )),
        Expanded(
            child: Divider(
          color: Colors.white,
        )),
        ListTile(
          leading: Icon(Icons.settings),
          iconColor: Colors.white,
          textColor: Colors.white,
          onTap: () => GoRouter.of(context).go('/profile'),
          title: Text("Profile"),
        ),
        ListTile(
          leading: Icon(Icons.person),
          iconColor: Colors.white,
          textColor: Colors.white,
          // onTap: () => GoRouter.of(context).go('/maploc'),
          title: Text("Local Admins"),
        ),
        ListTile(
          leading: Icon(Icons.location_city),
          iconColor: Colors.white,
          textColor: Colors.white,
          onTap: () => GoRouter.of(context).go('/maploc'),
          title: Text("Track Your Location"),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          iconColor: Colors.white,
          textColor: Colors.white,
          onTap: () => GoRouter.of(context).go('/main'),
          title: Text("Logout"),
        ),
      ],
    ),
  );
}

Widget _customDialog() {
  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 1.0,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          AppStrings.infoText,
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ));
}
