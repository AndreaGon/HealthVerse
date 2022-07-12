import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/model/users.dart';
import 'package:flutter_userprofile1/page/login_page/pages/test_page.dart';
import 'package:flutter_userprofile1/page/login_page/widget/login_widget.dart';
import 'package:flutter_userprofile1/page/profile_page/profile_page.dart';
import 'package:flutter_userprofile1/page/register_page/widgets/registerMode_appbar.dart';
import 'package:flutter_userprofile1/page/register_page/widgets/register_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      //final user = UserPreferences.myUser;
      appBar: buildRegisterAppBar(context, "Create Account"),
      //top bar
      backgroundColor: Color.fromARGB(255, 180, 229, 232),
      //list view # maybe edit this to change the look
      body: ListView(physics: BouncingScrollPhysics(), children: [
        RegisterWidget(),
      ]));
}