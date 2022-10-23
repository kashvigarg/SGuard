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
          ListTile(
            leading: Icon(Icons.settings),
            // onTap: () => GoRouter.of(context).go('/profile'),
            title: Text("Profile"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            // onTap: () => GoRouter.of(context).go('/maploc'),
            title: Text("Local Admins"),
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            onTap: () => GoRouter.of(context).go('/maploc'),
            title: Text("Track Your Location"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            onTap: () => GoRouter.of(context).go('/main'),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
