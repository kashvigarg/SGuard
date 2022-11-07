import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowering_humanity/view/dashboard/user_dashboard.dart';
import 'package:empowering_humanity/view/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

import '../../models/user_model.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto(
      {super.key, required this.imagePath, required this.imageText});

  final String imagePath;
  final String imageText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          minRadius: 40,
          child: Image.asset(imagePath),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          imageText,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class ProfileBanner extends StatelessWidget {
  const ProfileBanner({super.key});
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

  @override
  Widget build(BuildContext context) {
    final _user = getUser();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: _loginMethod(_user),
          onLongPress: () => GoRouter.of(context).push('/login'),
          child: const ProfilePhoto(
              imagePath: "assets/extras/user.png", imageText: "USER"),
        ),
        const ProfilePhoto(
            imagePath: "assets/extras/admin.png", imageText: "ADMIN"),
        const ProfilePhoto(
            imagePath: "assets/extras/superadmin.png",
            imageText: "SUPER ADMIN"),
      ],
    );
  }
}

_loginMethod(UserModel user) {
  if (user == Null)
    return SignUpPage();
  else
    return UserDashboard();
}
