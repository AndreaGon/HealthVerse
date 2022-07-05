import 'package:flutter_userprofile1/main.dart';
import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_userprofile1/page/login_page/pages/test_page.dart';
import 'package:flutter_userprofile1/page/profile_page/profile_page.dart';
import 'package:flutter_userprofile1/page/profile_page/utils/user_pref.dart';
import 'package:flutter_userprofile1/page/register_page/onboarding/onboarding1.dart';

class OnboardingPage1Widget extends StatefulWidget {
  @override
  _OnboardingPage1WidgetState createState() => _OnboardingPage1WidgetState();
}

class _OnboardingPage1WidgetState extends State<OnboardingPage1Widget> {
  final male = "Male";
  final female = "Female";
  final user = UserPreferences.myUser;
  final age_input = TextEditingController();
  final weight_input = TextEditingController();
  final height_input = TextEditingController();
  bool test = true;
  bool isButtonActive1 = true;
  bool isButtonActive2 = true;

  //current user login
  final curr_user = FirebaseAuth.instance.currentUser;

  get icon => null;
  @override
  void dispose() {
    age_input.dispose();
    weight_input.dispose();
    height_input.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "What is Your Gender?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          //Row for male and female
          //Need help with the buttons
          //Want to make it so that if 1 clicks the other is disabled
          //and to save the value gender on firebase
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 150,
                height: 80,
                child: ElevatedButton(
                  child: Text(
                    male,
                    style: TextStyle(fontSize: 35),
                  ),
                  onPressed: isButtonActive1
                      ? () {
                          setState(() => isButtonActive2 = false);
                          //setState(() => );
                        }
                      : null,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 150,
                height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: isButtonActive2 ? Colors.blue : Colors.green,
                  ),
                  child: Text(
                    female,
                    style: TextStyle(fontSize: 35),
                  ),
                  onPressed: isButtonActive2
                      ? () {
                          setState(() => isButtonActive1 = false);
                          //setState(() => );
                        }
                      : null,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "How old are you?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 196, 190, 190)),
            child: TextField(
              controller: age_input,
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(border: OutlineInputBorder()),
              //obscureText: true,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "What is Your Weight?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 196, 190, 190)),
            child: TextField(
              controller: weight_input,
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(border: OutlineInputBorder()),
              //obscureText: true,
            ),
          ),
          Text(
            "What is Your Height (in ft)?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 196, 190, 190)),
            child: TextField(
              controller: height_input,
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(border: OutlineInputBorder()),
              //obscureText: true,
            ),
          ),
          SizedBox(
            height: 120,
          ),
          //finish button
          Container(
            height: 50,
            width: 400,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 174, 219),
                border: Border.all(width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                )),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Text(
                'Finish',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              onPressed: () {
                //##for navigating to Onboarding 2 Page##
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
          )
        ]),
      );
}
