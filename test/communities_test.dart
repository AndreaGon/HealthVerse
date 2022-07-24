// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_userprofile1/model/post.dart';
import 'package:flutter_userprofile1/page/communities/communities.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() async {
  Widget testLike = MediaQuery(
      data: const MediaQueryData(), child: MaterialApp(home: Communities()));

  testWidgets('Display Username and Post along with the like function',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(testLike);

    // Verify that the app displays Username and Post on Comunities page
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Posts'), findsOneWidget);
    expect(find.text('Like'), findsOneWidget);

    //Add 5 minutes to timer
    await tester.tap(find.text('Like'));
    await tester.pumpAndSettle();
  });
}
