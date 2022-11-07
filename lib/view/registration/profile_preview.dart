import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowering_humanity/constants/common_widgets/app_button.dart';
import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/base_container.dart';
import 'package:empowering_humanity/constants/size_config.dart';
import 'package:empowering_humanity/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePreview extends StatelessWidget {
  ProfilePreview({super.key});

  final _user = getUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BgMain(
      widget: BaseContainer(
        height: SizeConfig.screenHeight * 0.80,
        width: SizeConfig.screenWidth * 0.8,
        widget: Column(
          children: [
            Center(child: Text("Profile Preview")),
            Text("Name:${_user.name}"),
            Text("Email: ${_user.id}"),
            Text("DOB: " + _user.dob.toString()),
            //Text("Status: " + _user.status.toString()),
            // Text("Blood Group: "),
            // Text("Contact No.: "+_user.),
            Text("Emergency Contacts "),
            // Text("Name: "),
            Text("Number: " + _user.contact1),
            // Text("Name: "),
            Text("Number: " + _user.contact2),
            AppButton(
                buttonColor: Colors.red,
                buttonText: "Edit",
                pressedFunc: () => GoRouter.of(context).push('/editprofile')),
            AppButton(
              buttonColor: Colors.green,
              buttonText: "Finish",
              pressedFunc: () => GoRouter.of(context).push('/user'),
            )
          ],
        ),
      ),
    ));
  }
}

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
