import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/widget/appbar_widget.dart';


class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    //current user login
     return Scaffold(
      //top bar
      appBar: buildAppBar(context, 'Settings'),
      backgroundColor: const Color.fromRGBO(156, 180, 171, 1),
      //list view # maybe edit this to change the look
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 125,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: double.infinity),
            decoration: BoxDecoration(
                color: const Color.fromARGB(116, 115, 150, 74),
                border: Border.all(width: 3),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                )),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                child: const Text(
                  'Logout',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  //signout and go to login page
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/');
                  FirebaseAuth.instance.signOut();
                }
                //=> FirebaseAuth.instance.signOut(),
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => LoginPage()));
                ),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: double.infinity),
            decoration: BoxDecoration(
                color: const Color.fromARGB(116, 115, 150, 74),
                border: Border.all(width: 3),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                )),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              child: const Text(
                'Credits',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    //title
                    title: const Text(
                      'Company',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        //add fontFamily to change font (add in the pubspec.yaml)
                      ),
                    ),

                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // box behind the TWEEN
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 222, 202, 186),
                              border: Border.all(width: 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              )),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            'Tween PLT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                        ),
                        //Spacing between Company & Developers
                        const SizedBox(
                          height: 100,
                          width: 40,
                          // child: DecoratedBox(
                          //   decoration: BoxDecoration(color: Colors.red), ),
                        ),
                        const Text(
                          'Developers',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        //Andrea Container
                        Container(
                          height: 50,
                          width: 500,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 222, 202, 186),
                              border: Border.all(width: 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              )),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            'Andrea Tantay  Gonzales',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        //Darshanaa Container
                        Container(
                          height: 50,
                          width: 900,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 222, 202, 186),
                              border: Border.all(width: 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              )),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            'Darshanaa Naresh',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        //Padmessh Container
                        Container(
                          height: 50,
                          width: 500,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 222, 202, 186),
                              border: Border.all(width: 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              )),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            'Padmessh Kalyan Kumar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    insetPadding: EdgeInsets.zero,
                    actions: [
                      TextButton(
                        child: const Text(
                          'Back',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    backgroundColor: const Color.fromARGB(255, 28, 99, 157),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
