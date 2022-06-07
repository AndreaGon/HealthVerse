import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.settings;

  return AppBar(
    leading: BackButton(
      color: Colors.white,
    ),
    backgroundColor: Color.fromARGB(255, 43, 91, 45),
    elevation: 0,
    title: Text("User Profile"),
    centerTitle: true,

    //for the settings page
    actions: [
      IconButton(
        icon: Icon(icon),
        color: Colors.white,
        onPressed: () {},
      ),
    ],
  );
}
