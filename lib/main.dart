import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/communities/communities.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_userprofile1/page/login_page/pages/login_page.dart';
import 'package:flutter_userprofile1/page/profile_page/profile_page.dart';
import 'package:flutter_userprofile1/page/settings_page/settings_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green[300],
        ),
        home: LoginPage());
  }
}
