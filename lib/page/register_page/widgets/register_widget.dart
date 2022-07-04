import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_userprofile1/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_userprofile1/page/login_page/pages/test_page.dart';
import 'package:flutter_userprofile1/page/register_page/onboarding/onboarding1.dart';
import 'package:flutter_userprofile1/widget/navigation_widget.dart';

import '../../../model/users.dart';
import '../../communities/communities.dart';
import 'package:uuid/uuid.dart';

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final formkey = GlobalKey<FormState>();
  final sign_in_emailController = TextEditingController();
  final sign_in_passwordController = TextEditingController();
  final confirm_passwordController = TextEditingController();

  get icon => null;
  @override
  void dispose() {
    sign_in_emailController.dispose();
    sign_in_passwordController.dispose();
    confirm_passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formkey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(),
            SizedBox(
              height: 50,
            ),
            Text(
              "Create Your Account",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            //Container for Confirm Email
            SizedBox(
              width: 400,
              child: TextFormField(
                controller: sign_in_emailController,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? "Enter Valid Email"
                        : null,
                obscureText: false,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            //Container for Password
            SizedBox(
              width: 400,
              child: TextFormField(
                controller: sign_in_passwordController,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: 'Password', border: OutlineInputBorder()),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? "Enter Minimum 6 characters"
                    : null,
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 190,
            ),
            //Continue Button
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
                  'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                onPressed: () {
                  signUp();
                  //##for navigating to Onboarding 1 Page##
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Onboarding1Page(email: sign_in_emailController.text.trim())));
                },
              ),
            )
          ]),
        ),
      );

  Future signUp() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: sign_in_emailController.text.trim(),
        password: sign_in_passwordController.text.trim(),
      );

    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  
}
