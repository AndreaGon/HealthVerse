// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_userprofile1/firebase_options.dart';

import 'package:flutter_userprofile1/main.dart';
import 'package:flutter_userprofile1/page/timer_page/timer_page.dart';

void main() async {
  Widget testTimer = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: new TimerPage()));

  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  testWidgets('Timer should add 5 minutes', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(testTimer);

    // Verify that timer starts at 00:00:00
    expect(find.text('00:00:00'), findsOneWidget);
    expect(find.text('Add 5 min'), findsOneWidget);

    //Add 5 minutes to timer
    await tester.tap(find.text('Add 5 min'));
    await tester.pumpAndSettle();

    expect(find.text('00:05:00'), findsOneWidget);
  });

  testWidgets('Timer should add 10 minutes', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(testTimer);

    // Verify that timer starts at 00:00:00
    expect(find.text('00:00:00'), findsOneWidget);
    expect(find.text('Add 10 min'), findsOneWidget);

    //Add 5 minutes to timer
    await tester.tap(find.text('Add 10 min'));
    await tester.pumpAndSettle();

    expect(find.text('00:10:00'), findsOneWidget);
  });

  testWidgets('Timer should add 15 minutes', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(testTimer);

    // Verify that timer starts at 00:00:00
    expect(find.text('00:00:00'), findsOneWidget);
    expect(find.text('Add 5 min'), findsOneWidget);
    expect(find.text('Add 10 min'), findsOneWidget);

    //Add 5 minutes to timer
    await tester.tap(find.text('Add 5 min'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add 10 min'));
    await tester.pumpAndSettle();

    expect(find.text('00:15:00'), findsOneWidget);
  });
}
