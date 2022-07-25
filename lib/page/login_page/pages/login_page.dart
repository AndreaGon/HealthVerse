import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/login_page/widget/login_widget.dart';
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
      backgroundColor: const Color.fromARGB(255, 83, 113, 135),
      //list view # maybe edit this to change the look
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong!'),
              );
            }
            if (snapshot.hasData) {
              return Navigation();
            } else {
              return LoginWidget();
            }
          }));
}
