import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_userprofile1/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_userprofile1/page/login_page/pages/test_page.dart';
import 'package:flutter_userprofile1/page/profile_page/profile_page.dart';
import 'package:flutter_userprofile1/page/profile_page/utils/user_pref.dart';
import 'package:flutter_userprofile1/page/register_page/onboarding/onboarding1.dart';
import 'package:flutter_userprofile1/widget/navigation_widget.dart';
import 'package:uuid/uuid.dart';

import '../../../model/users.dart';

class OnboardingPage1Widget extends StatefulWidget {
  final String email;
  const OnboardingPage1Widget({super.key, required this.email});

  @override
  _OnboardingPage1WidgetState createState() => _OnboardingPage1WidgetState();
}

class _OnboardingPage1WidgetState extends State<OnboardingPage1Widget> {
  final male = "Male";
  final female = "Female";
  var gender = "";
  final user = UserPreferences.myUser;
  var age_input = TextEditingController();
  var weight_input = TextEditingController();
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
                          this.gender = male;
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
                          this.gender = female;
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
          SizedBox(
            height: 120,
          ),
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
                createNewUserDetails();
                //##for navigating to Onboarding 2 Page##
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Navigation()));
              },
            ),
          )
        ]),
      );

    Future createNewUserDetails() async {
      final docPost = FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser!.uid);
      Users postJson = Users(
        id: Uuid().v4(),
        imagePath: "../../assets/user_profile.png",
        name: "",
        gender: this.gender,
        height: "",
        weight: weight_input.text,
        email: '${widget.email}',
        points: "0",
        calories: "0",
        hours: "0",
        steps: "0",
        date: "0",
        last_exercise: "0"
      );
      
      await docPost.set(postJson.toJson());
    }
}
