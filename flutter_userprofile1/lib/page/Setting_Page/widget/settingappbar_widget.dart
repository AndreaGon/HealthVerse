import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildSettingAppBar(BuildContext context) {
  //final icon = CupertinoIcons.settings;

  return AppBar(
    leading: BackButton(
      color: Colors.white,
    ),
    backgroundColor: Color.fromARGB(255, 43, 91, 45),
    elevation: 0,
    title: Text("Setting"),
    centerTitle: true,
  );
}
