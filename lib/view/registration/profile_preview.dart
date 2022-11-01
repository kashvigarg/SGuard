import 'package:empowering_humanity/constants/common_widgets/app_button.dart';
import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/base_container.dart';
import 'package:empowering_humanity/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePreview extends StatelessWidget {
  const ProfilePreview({super.key});

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
            Text("Name: "),
            Text("Email: "),
            Text("Age: "),
            Text("Status: "),
            Text("Blood Group: "),
            Text("Contact No.: "),
            Text("Emergency Contacts "),
            Text("Name: "),
            Text("Number: "),
            Text("Name: "),
            Text("Number: "),
            AppButton(
                buttonColor: Colors.red,
                buttonText: "Edit",
                pressedFunc: () => GoRouter.of(context).push('/editprofile')),
            AppButton(
              buttonColor: Colors.green,
              buttonText: "Finish",
              pressedFunc: () => GoRouter.of(context).push('/user2'),
            )
          ],
        ),
      ),
    ));
  }
}
