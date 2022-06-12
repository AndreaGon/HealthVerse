import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/Profile_Pages/profile_page.dart';

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
        //main page (currently Profile Page)
        home: ProfilePage());
  }
}