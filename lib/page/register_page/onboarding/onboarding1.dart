import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/register_page/widgets/onboarding1_widget.dart';
import 'package:flutter_userprofile1/page/register_page/widgets/registerMode_appbar.dart';

class Onboarding1Page extends StatefulWidget {
  final String email;
  final String name;
  const Onboarding1Page({super.key, required this.email, required this.name});

  @override
  _Onboarding1Page createState() => _Onboarding1Page();
}

class _Onboarding1Page extends State<Onboarding1Page> {

  @override
  Widget build(BuildContext context) => Scaffold(
      //final user = UserPreferences.myUser;
      appBar: buildRegisterAppBar(context, 'You'),
      //top bar
      backgroundColor: const Color.fromARGB(255, 180, 229, 232),
      //list view # maybe edit this to change the look
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        OnboardingPage1Widget(email: widget.email, name: widget.name),
      ]));
}
