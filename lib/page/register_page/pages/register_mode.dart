import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/register_page/pages/register_page.dart';
import 'package:flutter_userprofile1/page/register_page/widgets/registerMode_appbar.dart';

class RegisterModePage extends StatefulWidget {
  @override
  _RegisterModePageState createState() => _RegisterModePageState();
}

class _RegisterModePageState extends State<RegisterModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //top bar
      appBar: buildRegisterAppBar(context, "Sign Up"),
      backgroundColor: Color.fromARGB(255, 180, 229, 232),
      //list view # maybe edit this to change the look
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 80,
            // child: DecoratedBox(
            //   decoration: BoxDecoration(color: Colors.red),
            // ),
          ),
          //Welcome Msg
          //Help modify fontFamily later
          Text(
            "Welcome To HealthVerse.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          //Help modify fontFamily later
          Text(
            "Lets Get Started",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          //register button
          Container(
            constraints: BoxConstraints(maxHeight: double.infinity),
            decoration: BoxDecoration(
                color: Color.fromARGB(116, 149, 150, 147),
                border: Border.all(width: 3),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                )),
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                child: Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                }),
          ),
          SizedBox(
            height: 20,
          ),
          //Help modify fontFamily later
          Text(
            "OR",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          //button for facebook
          Container(
            constraints: BoxConstraints(maxHeight: double.infinity),
            decoration: BoxDecoration(
                color: Color.fromARGB(116, 149, 150, 147),
                border: Border.all(width: 3),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                )),
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Continue with ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Facebook',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 25)),
                    ],
                  ),
                ),
                onPressed: () {
                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => LoginPage()));
                }),
          ),
          //button for email
          Container(
            constraints: BoxConstraints(maxHeight: double.infinity),
            decoration: BoxDecoration(
                color: Color.fromARGB(116, 149, 150, 147),
                border: Border.all(width: 3),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                )),
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Continue with ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Email',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 54, 171, 60),
                              fontSize: 25)),
                    ],
                  ),
                ),
                onPressed: () {
                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => LoginPage()));
                }),
          ),
        ],
      ),
    );
  }
}
