import 'package:flutter/material.dart';
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
      appBar: buildRegisterAppBar(context, 'Create Account'),
      //top bar
      backgroundColor: const Color.fromARGB(255, 180, 229, 232),
      //list view # maybe edit this to change the look
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        RegisterWidget(),
      ]));
}
