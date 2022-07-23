import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/settings_page/settings_page.dart';

AppBar buildAppBar(BuildContext context, String title) {
  const icon = CupertinoIcons.settings;

  return AppBar(
    leading: const BackButton(
      color: Colors.white,
    ),
    backgroundColor: const Color.fromARGB(255, 43, 91, 45),
    elevation: 0,
    title: Text(title),
    centerTitle: true,

    //for the settings page
    actions: [
      IconButton(
        icon: const Icon(icon),
        color: Colors.white,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingsPage()));
        },
      ),
    ],
  );
}
