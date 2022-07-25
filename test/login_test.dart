import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_userprofile1/page/login_page/pages/login_page.dart';

void main() async {
  Widget testLogin = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: new LoginPage()));

  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  testWidgets('Login To App', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(testLogin);

    // find username box
    expect(find.text('Username'), findsOneWidget);

    //Add add the username to username section
    await tester.tap(find.text('Username'));
    await tester.enterText(find.byType(TextField), "test@gmail.com");

    // find password box
    expect(find.text('Password'), findsOneWidget);

    //Add add the username to username section
    await tester.tap(find.text('Password'));
    await tester.enterText(find.byType(TextField), "test1234");

    expect(find.text('Timer'), findsOneWidget);
  });

  testWidgets('Register Button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(testLogin);

    // Verify that timer starts at 00:00:00
    expect(find.text('Register New Account'), findsOneWidget);

    //Add 5 minutes to timer
    await tester.tap(find.text('Register New Account'));
    await tester.pumpAndSettle();

    expect(find.text('Sign Up'), findsOneWidget);
  });
}
