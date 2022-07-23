import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/model/admin.dart';
import 'package:flutter_userprofile1/model/users.dart';

import 'package:flutter_userprofile1/page/profile_page/widget/profile_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../widget/appbar_widget.dart';
import 'widget/profile_widget.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List user = [];
  List adminNotif = [];

  @override
  Widget build(BuildContext context) {

    getUser();
    getAdminNotif();
    return FutureBuilder<List>(
      future: Future.wait([
        getUser(),
        getAdminNotif()
      ]),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        if( snapshot.connectionState == ConnectionState.waiting){
          return  Scaffold(
            body: Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.purple, size: 200
              )
            )
          );
        }
        else{
          user = snapshot.data![0];
          adminNotif = snapshot.data![1];
          return Scaffold(
      //top bar
            appBar: buildAppBar(context, 'Profile Page'),
            backgroundColor: const Color.fromARGB(255, 228, 218, 218),
            //list view # maybe edit this to change the look
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 10,
                ),
                //the image method
                ProfileWidget(
                  imagePath: '../assets/user_profile.png',
                  onClicked: () async {},
                ),
                const SizedBox(
                  height: 24,
                ),
                buildInfo(user.first),
                buildContent(user.first),
                buildActivity(user.first),
                buildAdminNotif(adminNotif.first)
              ],
            ),
          );
      }
  });
  }

  // user info display
  Widget buildInfo(Users user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user.email,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Total Points: ${user.points}',
            style: const TextStyle(color: Colors.black),
          ),
        ],
      );

  // Container with icons & user info
  Widget buildContent(Users user) => Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 202, 186),
            border: Border.all(width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            )),
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.all(20),
        child: Row(
          //putting the 3 icons and text next to each other
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              //to put the icon, and 2 text on top of each other
              children: [
                Container(
                  //box surrounding the icon
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(116, 115, 150, 74),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: const Icon(Icons.local_fire_department_sharp,
                      size: 35, color: Color.fromARGB(255, 228, 218, 218)),
                ),
                Text(
                  user.calories,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('Calories'),
              ],
            ),
            Column(
              //to put the icon, and 2 text on top of each other
              children: [
                Container(
                  //box surrounding the icon
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(116, 115, 150, 74),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: const Icon(Icons.timer,
                      size: 35, color: Color.fromARGB(255, 228, 218, 218)),
                ),
                Text(
                  user.hours,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('Hours'),
              ],
            ),
            Column(
              //to put the icon, and 2 text on top of each other
              children: [
                Container(
                  //box surrounding the icon
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(116, 115, 150, 74),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: const Icon(Icons.directions_walk,
                      size: 40, color: Color.fromARGB(255, 228, 218, 218)),
                ),
                Text(
                  user.steps,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('Steps'),
              ],
            ),
          ],
        ),
      );

  Widget buildActivity(Users user) => Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 202, 186),
            border: Border.all(width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            )),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            //Displaying the Last Activity Text
            const Align(
              alignment: Alignment(-1, -1),
              child: Text('Last Activity',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            //Aligning the Icon & Latest Exercise
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.circle,
                  size: 10,
                ),
                const SizedBox(
                  width: 24,
                ),
                Text(
                  'Total calories burned as of today: ${user.calories}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      );

  Widget buildAdminNotif(Admin admin) => Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 202, 186),
            border: Border.all(width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            )),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            //Displaying the Last Activity Text
            const Align(
              alignment: Alignment(-1, -1),
              child: Text('Health Tips',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            //Aligning the Icon & Latest Exercise
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.circle,
                  size: 10,
                ),
                const SizedBox(
                  width: 24,
                ),
                Text(
                  admin.notif_content,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      );
  

  Future<List> getUser() async {
    final currUser = FirebaseAuth.instance.currentUser!.uid;

    QuerySnapshot query = await FirebaseFirestore.instance.collection('User').where('id', isEqualTo: currUser).get();

    final user = query.docs.map((doc)=> Users.fromJson(doc.data() as Map<String, dynamic>)).toList();

    print(user);

    return user;
  }

  Future<List> getAdminNotif() async{
    QuerySnapshot query = await FirebaseFirestore.instance.collection('Admin_notif').orderBy('timestamp', descending: true).limit(1).get();
    final admin = query.docs.map((doc)=> Admin.fromJson(doc.data() as Map<String, dynamic>)).toList();

    return admin;
  }
}
