import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          minRadius: 50,
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
            ProfilePhoto(
                imagePath: "assets/extras/Vector.png", imageText: "USER"),
            ProfilePhoto(
                imagePath: "assets/extras/Vector.png", imageText: "ADMIN"),
          ],
        ),
        ProfilePhoto(
            imagePath: "assets/extras/Vector.png", imageText: "SUPER ADMIN"),
      ],
    );
  }
}
