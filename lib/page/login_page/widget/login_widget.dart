import 'dart:ffi';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/main.dart';
import 'package:flutter_userprofile1/page/register_page/pages/register_mode.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  get icon => null;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 150,
          ),
          Text(
            "HealthVerse",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Sign in to your account",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          //Text box for email
          //#Make sized box for the text field
          SizedBox(
            width: 400,
            child: TextFormField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? "Enter Valid Email"
                      : null,
              //obscureText: true,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          //Text box for password
          //#Make sizedbox for the text field
          SizedBox(
            width: 400,
            child: TextFormField(
              controller: passwordController,
              cursorColor: Colors.white,
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
            height: 30,
          ),
          SizedBox(
            width: 400,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 93, 169, 138), //background color of button

                  elevation: 3, //elevation of button
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              icon: Icon(
                Icons.lock_open,
                size: 32,
              ),
              label: Text(
                "Sign In",
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                signIn();
              },
            ),
          ), //sizedbox for button
          SizedBox(
            height: 50,
          ),
          //Register Account Button
          SizedBox(
            height: 50,
            width: 400,
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                side: BorderSide(width: 1, color: Colors.white),
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Text(
                'Register Account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
              onPressed: () {
                //##for navigating to Register Page##
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterModePage()));
              },
            ),
          )
        ]),
      );

  Future signIn() async {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => Center(
    //           child: CircularProgressIndicator(),
    //         ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    //navigatorKey.currentState.popUntil((route) => route.isFirst);
  }
}
