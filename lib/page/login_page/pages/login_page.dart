import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/model/users.dart';
import 'package:flutter_userprofile1/page/login_page/pages/test_page.dart';
import 'package:flutter_userprofile1/page/login_page/widget/login_widget.dart';
import 'package:flutter_userprofile1/page/profile_page/profile_page.dart';
import 'package:flutter_userprofile1/widget/navigation_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      //final user = UserPreferences.myUser;

      //top bar
      backgroundColor: Color.fromARGB(255, 83, 113, 135),
      //list view # maybe edit this to change the look
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final user = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Something went wrong!"),
              );
            }
            if (snapshot.hasData) {
              return Navigation();
            } else {
              return LoginWidget();
            }
          }));
}
