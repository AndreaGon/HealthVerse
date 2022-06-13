import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/Login&Register_Pages/pages/login_page.dart';
import 'package:flutter_userprofile1/page/Profile_Pages/utils/user_pref.dart';
import 'package:flutter_userprofile1/page/Setting_Page/widget/settingappbar_widget.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      //top bar
      appBar: buildSettingAppBar(context),
      backgroundColor: Color.fromRGBO(156, 180, 171, 1),
      //list view # maybe edit this to change the look
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 125,
          ),
          Container(
            constraints: BoxConstraints(maxHeight: double.infinity),
            decoration: BoxDecoration(
                color: Color.fromARGB(116, 115, 150, 74),
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
                'Logout',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ),
          // Text(
          //   "Here1",
          //   textAlign: TextAlign.center,
          // ),
          SizedBox(
            height: 100,
          ),
          // Text(
          //   "Here2",
          //   textAlign: TextAlign.center,
          // ),
          Container(
            constraints: BoxConstraints(maxHeight: double.infinity),
            decoration: BoxDecoration(
                color: Color.fromARGB(116, 115, 150, 74),
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
                'Credits',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    //title
                    title: Text(
                      "Company",
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
                              color: Color.fromARGB(255, 222, 202, 186),
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )),
                          padding: const EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Tween PLT",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                        ),
                        //Spacing between Company & Developers
                        SizedBox(
                          height: 100,
                          width: 40,
                          // child: DecoratedBox(
                          //   decoration: BoxDecoration(color: Colors.red), ),
                        ),
                        Text(
                          "Developers",
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
                              color: Color.fromARGB(255, 222, 202, 186),
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )),
                          padding: const EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Andrea Tantay  Gonzales",
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
                              color: Color.fromARGB(255, 222, 202, 186),
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )),
                          padding: const EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Darshanaa Naresh",
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
                              color: Color.fromARGB(255, 222, 202, 186),
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )),
                          padding: const EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Padmessh Kalyan Kumar",
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
                        child: Text(
                          "Back",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    backgroundColor: Color.fromARGB(255, 28, 99, 157),
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
