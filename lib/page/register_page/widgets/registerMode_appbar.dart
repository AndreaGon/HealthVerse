import 'package:flutter/material.dart';

AppBar buildRegisterAppBar(BuildContext context, String title) {
  return AppBar(
    leading: const BackButton(
      color: Colors.black,
    ),
    backgroundColor: const Color.fromARGB(255, 193, 193, 193),
    elevation: 0,
    title: Text(
      title,
      style: const TextStyle(color: Colors.black),
    ),
    centerTitle: true,
  );
}
