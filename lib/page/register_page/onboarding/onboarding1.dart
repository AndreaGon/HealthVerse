import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/model/user.dart';
import 'package:flutter_userprofile1/page/login_page/pages/test_page.dart';
import 'package:flutter_userprofile1/page/login_page/widget/login_widget.dart';
import 'package:flutter_userprofile1/page/profile_page/profile_page.dart';
import 'package:flutter_userprofile1/page/register_page/widgets/onboarding1_widget.dart';
import 'package:flutter_userprofile1/page/register_page/widgets/registerMode_appbar.dart';
import 'package:flutter_userprofile1/page/register_page/widgets/register_widget.dart';

class Onboarding1Page extends StatefulWidget {
  @override
  _Onboarding1Page createState() => _Onboarding1Page();
}

class _Onboarding1Page extends State<Onboarding1Page> {
  @override
  Widget build(BuildContext context) => Scaffold(
      //final user = UserPreferences.myUser;
      appBar: buildRegisterAppBar(context, "You"),
      //top bar
      backgroundColor: Color.fromARGB(255, 180, 229, 232),
      //list view # maybe edit this to change the look
      body: ListView(physics: BouncingScrollPhysics(), children: [
        OnboardingPage1Widget(),
      ]));
}
