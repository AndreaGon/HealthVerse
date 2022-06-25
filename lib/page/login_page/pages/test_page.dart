import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    @override
        //current user login
        final curr_user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Padding(
        padding: EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In As",
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              curr_user.email!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
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
                Icons.arrow_back,
                size: 32,
              ),
              label: Text(
                "Logout Out",
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
