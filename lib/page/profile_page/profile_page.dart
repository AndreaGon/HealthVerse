import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/model/user.dart';
import 'package:flutter_userprofile1/page/profile_page/utils/user_pref.dart';
import 'package:flutter_userprofile1/widget/appbar_widget.dart';
import 'package:flutter_userprofile1/page/profile_page/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      //top bar
      appBar: buildAppBar(context, "User Profile"),
      backgroundColor: Color.fromRGBO(156, 180, 171, 1),
      //list view # maybe edit this to change the look
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 10,
          ),
          //the image method
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(
            height: 24,
          ),
          buildInfo(user),
          buildContent(user),
          buildActivity(user),
        ],
      ),
    );
  }

  // user info display
  Widget buildInfo(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user.email,
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Total Points: ${user.points}",
            style: TextStyle(color: Colors.black),
          ),
        ],
      );

  // Container with icons & user info
  Widget buildContent(User user) => Container(
        decoration: BoxDecoration(
            color: Colors.lightBlue[100],
            border: Border.all(width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            )),
        padding: const EdgeInsets.all(30),
        margin: EdgeInsets.all(20),
        child: Row(
          //putting the 3 icons and text next to each other
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              //to put the icon, and 2 text on top of each other
              children: [
                Container(
                  //box surrounding the icon
                  decoration: BoxDecoration(
                      color: Color.fromARGB(116, 115, 150, 74),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                  padding: const EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Icon(Icons.local_fire_department_sharp,
                      size: 35, color: Colors.lightBlue[100]),
                ),
                Text(
                  '${user.calories}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('Calories'),
              ],
            ),
            Column(
              //to put the icon, and 2 text on top of each other
              children: [
                Container(
                  //box surrounding the icon
                  decoration: BoxDecoration(
                      color: Color.fromARGB(116, 115, 150, 74),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                  padding: const EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child:
                      Icon(Icons.timer, size: 35, color: Colors.lightBlue[100]),
                ),
                Text(
                  '${user.hours}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('Hours'),
              ],
            ),
            Column(
              //to put the icon, and 2 text on top of each other
              children: [
                Container(
                  //box surrounding the icon
                  decoration: BoxDecoration(
                      color: Color.fromARGB(116, 115, 150, 74),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                  padding: const EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Icon(Icons.directions_walk,
                      size: 40, color: Colors.lightBlue[100]),
                ),
                Text(
                  '${user.steps}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('Steps'),
              ],
            ),
          ],
        ),
      );

  Widget buildActivity(User user) => Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 108, 172, 223),
            border: Border.all(width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            )),
        padding: const EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            //Displaying the Last Activity Text
            Align(
              alignment: Alignment(-1, -1),
              child: Text("Last Activity",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            //Aligning the Icon & Latest Exercise
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                ),
                const SizedBox(
                  width: 24,
                ),
                Text(
                  "${user.date}",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            Text(
              "${user.last_exercise} . ${user.hours} Hours . ${user.calories} Calories",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
}
