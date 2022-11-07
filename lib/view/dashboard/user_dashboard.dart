import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowering_humanity/constants/app_logos.dart';
import 'package:empowering_humanity/constants/app_strings.dart';
import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/banner.dart';
import 'package:empowering_humanity/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    // Signaling signaling = Signaling();
    // RTCVideoRenderer _localRenderer = RTCVideoRenderer();
    // RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
    // String? roomId;
    // TextEditingController textEditingController =
    // TextEditingController(text: '');

    // Stream<List<UserModel>> readUsers() => FirebaseFirestore.instance
    //     .collection('users')
    //     .snapshots()
    //     .map((snapshot) => snapshot.docs
    //         .map((doc) => UserModel.fromJson(doc.data() as String))
    //         .toList());

    // final UserModel _user = FirebaseAuth.instance.currentUser! as UserModel;

    // Convert to City object
    final _user = getUser();
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
                        _pingEmergencyContacts(contact: _user.contact1);
                        _pingEmergencyContacts(contact: _user.contact2);
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
          AppButton(
              icon: Icons.call,
              pressedFunc: () {
                _makePhoneCall(num: AppStrings.police);
              },
              buttonColor: Colors.white,
              buttonText: "Call Police",
              height: 70,
              width: 300),
          AppButton(
              icon: Icons.add_location,
              pressedFunc: () {
                _pingEmergencyContacts(contact: _user.contact1);
                _pingEmergencyContacts(contact: _user.contact2);
              },
              buttonColor: Colors.white,
              buttonText: "Ping Emergency Contacts",
              height: 70,
              width: 300)
        ],
      )),
    );
  }
}

//
getUser() async {
  final db = FirebaseFirestore.instance.collection('users');
  final ref = db.doc().withConverter(
        fromFirestore: UserModel.fromFirestore,
        toFirestore: (UserModel user, _) => user.toFirestore(),
      );
  final docSnap = await ref.get();
  final user = docSnap.data();
  return user;
}

// app functions

_makePhoneCall({required String num}) async {
  var url = ("tel:$num");
  var finUrl = Uri.parse(url);
  if (await canLaunchUrl(finUrl)) {
    await launchUrl(finUrl);
  } else {
    throw 'Could not launch $url';
  }
}

_pingEmergencyContacts({required String contact}) async {
  var num1 = (contact);

  if (await canLaunchUrl(Uri.parse(num1))) {
    await canLaunchUrl(Uri.parse(("sms: $num1")));
  }
}

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Options",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )),
        const Expanded(
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
          onTap: () => GoRouter.of(context).go('/temp'),
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
