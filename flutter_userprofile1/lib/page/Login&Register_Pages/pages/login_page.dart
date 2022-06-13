import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //final user = UserPreferences.myUser;

    return Scaffold(
      //top bar
      backgroundColor: Color.fromARGB(255, 83, 113, 135),
      //list view # maybe edit this to change the look
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 100,
            child: DecoratedBox(
                decoration: BoxDecoration(
              color: Colors.red,
            )),
          ),
          Text(
            "HealthVerse",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
