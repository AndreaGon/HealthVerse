import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_userprofile1/page/profile_page/profile_page.dart';

void main() async {
  Widget testProfile = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: new ProfilePage()));

  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  testWidgets('To Settings Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(testProfile);

    // find username box
    expect(find.text('User Profile'), findsOneWidget);

    //Add add the username to username section
    await tester.tap(find.byIcon(CupertinoIcons.settings));

    // find password box
    expect(find.text('Settings'), findsOneWidget);
  });
}
