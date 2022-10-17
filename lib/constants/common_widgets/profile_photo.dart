import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

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
          minRadius: 47,
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => GoRouter.of(context).push('userdash'),
              child: ProfilePhoto(
                  imagePath: "assets/extras/user.png", imageText: "USER"),
            ),
            ProfilePhoto(
                imagePath: "assets/extras/admin.png", imageText: "ADMIN"),
          ],
        ),
        ProfilePhoto(
            imagePath: "assets/extras/superadmin.png",
            imageText: "SUPER ADMIN"),
      ],
    );
  }
}
