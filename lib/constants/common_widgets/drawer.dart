import 'package:empowering_humanity/constants/common_widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black45,
      elevation: 6,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SafeArea(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                minRadius: 50,
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
          AppButton(
            buttonColor: Colors.black45,
            buttonText: "Home",
            textColor: Colors.white,
            pressedFunc: () {},
            icon: Icons.home,
          ),
          AppButton(
            buttonColor: Color.fromRGBO(0, 0, 0, 0.451),
            buttonText: "Profile",
            textColor: Colors.white,
            pressedFunc: () {},
            icon: Icons.pages,
          ),
          AppButton(
            buttonColor: Colors.black45,
            buttonText: "Local Admins",
            textColor: Colors.white,
            pressedFunc: () {},
            icon: Icons.person,
          ),
          AppButton(
            buttonColor: Colors.black45,
            buttonText: "Feedback",
            textColor: Colors.white,
            pressedFunc: () {},
            icon: Icons.feedback_rounded,
          ),
          AppButton(
            buttonColor: Colors.black45,
            buttonText: "Logout",
            textColor: Colors.white,
            pressedFunc: () {
              Navigator.pop(context);
            },
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}
