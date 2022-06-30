import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/communities/communities.dart';

import '../../widget/navigation_widget.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_userprofile1/page/login_page/pages/login_page.dart';
import 'package:flutter_userprofile1/page/login_page/pages/test_page.dart';
import 'package:flutter_userprofile1/page/login_page/widget/login_widget.dart';
import 'package:flutter_userprofile1/page/profile_page/profile_page.dart';

import 'package:flutter_userprofile1/page/register_page/onboarding/onboarding1.dart';
import 'package:flutter_userprofile1/page/register_page/pages/register_mode.dart';
import 'package:flutter_userprofile1/page/register_page/pages/register_page.dart';
import 'package:flutter_userprofile1/page/register_page/widgets/register_widget.dart';
import 'package:flutter_userprofile1/page/settings_page/settings_page.dart';
import 'firebase_options.dart';
import 'package:flutter_userprofile1/page/timer_page/timer_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

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
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 225, 229, 130),
        ),
        home: Navigation());
  }
}
