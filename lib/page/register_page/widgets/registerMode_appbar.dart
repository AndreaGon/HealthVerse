import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/settings_page/settings_page.dart';

AppBar buildRegisterAppBar(BuildContext context, String title) {
  final icon = CupertinoIcons.settings;

  return AppBar(
    leading: BackButton(
      color: Colors.black,
    ),
    backgroundColor: Color.fromARGB(255, 193, 193, 193),
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
    centerTitle: true,
  );
}
