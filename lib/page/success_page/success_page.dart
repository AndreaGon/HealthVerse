import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../model/users.dart';
import '../../widget/appbar_widget.dart';

class SuccessPage extends StatefulWidget {
  late int timeDuration;

  SuccessPage({Key? key, required this.timeDuration}) : super(key: key);
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  List user = [];
  String points = "0";
  String caloriesBurned = "0";
  String hoursExercised = "0";
  
  @override
  Widget build(BuildContext context) {
    updatePoints();
    return FutureBuilder<List>(
      future: Future.wait([
        updatePoints(),
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

          return Scaffold(
      //top bar
            appBar: buildAppBar(context, "Success!"),
            backgroundColor: Color.fromARGB(255, 228, 218, 218),
            //list view # maybe edit this to change the look
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 10,
                ),
                buildSuccess(context)
              ],
            ),
          );
        }
    }
  );}

  Widget buildSuccess(BuildContext context) => Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 222, 202, 186),
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
              child: Text("Well Done!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            //Aligning the Icon & Latest Exercise
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 24,
                ),
                Text(
                  "You earned 5 points!",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      );

      Future<void> updatePoints() async {
        final curr_user = FirebaseAuth.instance.currentUser!.uid;
        QuerySnapshot query = await FirebaseFirestore.instance.collection("User").where("id", isEqualTo: curr_user).get();

        final user = query.docs.map((doc)=> Users.fromJson(doc.data() as Map<String, dynamic>)).toList();
        points = (int.parse(user.first.points) + 5).toString();
        caloriesBurned = ((widget.timeDuration / 60) * (5 * 3.5 * int.parse(user.first.weight))/200).toString();
        hoursExercised = (int.parse(user.first.hours) + (widget.timeDuration) / 3600).toString();
        FirebaseFirestore.instance.collection("User").doc(curr_user).update({"points": (points), "last_exercise": DateTime.now(), "calories": caloriesBurned, "hours": hoursExercised});
      }
}