import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/Setting_Page/settings_page.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.settings;

  return AppBar(
    leading: BackButton(
      color: Colors.white,
    ),
    backgroundColor: Color.fromARGB(255, 81, 125, 82),
    elevation: 0,
    title: Text("User Profile"),
    centerTitle: true,

    //for the settings page
    actions: [
      IconButton(
        icon: Icon(icon),
        color: Colors.white,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingsPage()));
        },
      ),
    ],
  );
}
