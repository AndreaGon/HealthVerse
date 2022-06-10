import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/communities/communities.dart';
import 'package:flutter_userprofile1/page/profile_page/profile_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = "User Profile";

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green[300],
        ),
        title: title,
        home: Communities());
  }
}
