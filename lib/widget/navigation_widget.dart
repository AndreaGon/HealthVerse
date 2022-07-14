import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/profile_page/profile_page.dart';
import 'package:flutter_userprofile1/page/timer_page/timer_page.dart';

import '../page/communities/communities.dart';

class Navigation extends StatefulWidget{
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State {
  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    TimerPage(),
    ProfilePage(),
    Communities()
    
  ];

 @override
 Widget build(BuildContext context) {
  
   return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: _selectedIndex, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           label: "Home",
           
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.person_rounded),
           label: "Profile",
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.party_mode),
           label: "Communities"
         )
       ],
       onTap: _onItemTapped,
     ),
   );
 }

 void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
}