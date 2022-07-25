import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/widget/navigation_widget.dart';

import '../../../model/users.dart';

class OnboardingPage1Widget extends StatefulWidget {
  final String email;
  final String name;
  const OnboardingPage1Widget({super.key, required this.email, required this.name});

  @override
  _OnboardingPage1WidgetState createState() => _OnboardingPage1WidgetState();
}

class _OnboardingPage1WidgetState extends State<OnboardingPage1Widget> {
  final male = 'Male';
  final female = 'Female';
  var gender = '';
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
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            'What is Your Gender?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          //Row for male and female
          //Need help with the buttons
          //Want to make it so that if 1 clicks the other is disabled
          //and to save the value gender on firebase
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 150,
                height: 80,
                child: ElevatedButton(
                  onPressed: isButtonActive1
                      ? () {
                          setState(() => isButtonActive2 = false);
                          gender = male;
                        }
                      : null,
                  child: Text(
                    male,
                    style: const TextStyle(fontSize: 35),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 150,
                height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: isButtonActive2 ? Colors.blue : Colors.green,
                  ),
                  onPressed: isButtonActive2
                      ? () {
                          setState(() => isButtonActive1 = false);
                          gender = female;
                        }
                      : null,
                  child: Text(
                    female,
                    style: const TextStyle(fontSize: 35),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'How old are you?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 196, 190, 190)),
            child: TextField(
              controller: age_input,
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              //obscureText: true,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'What is Your Weight?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 196, 190, 190)),
            child: TextField(
              controller: weight_input,
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              //obscureText: true,
            ),
          ),
          const Text(
            'What is Your Height (in ft)?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 196, 190, 190)),
            child: TextField(
              controller: height_input,
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              //obscureText: true,
            ),
          ),
          const SizedBox(
            height: 120,
          ),
          //finish button
          Container(
            height: 50,
            width: 400,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 231, 174, 219),
                border: Border.all(width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                )),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: const Text(
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
        id: FirebaseAuth.instance.currentUser!.uid,
        imagePath: '../../assets/user_profile.png',
        name: widget.name,
        gender: gender,
        height: height_input.text,
        weight: weight_input.text,
        email: widget.email,
        points: '0',
        calories: '0',
        hours: '0',
        steps: '0',
        date: '0',
        last_exercise: '0'
      );
      
      await docPost.set(postJson.toJson());
    }
}
