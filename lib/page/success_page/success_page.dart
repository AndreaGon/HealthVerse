import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../model/users.dart';
import '../../widget/appbar_widget.dart';

// ignore: must_be_immutable
class SuccessPage extends StatefulWidget {
  late int timeDuration;

  SuccessPage({Key? key, required this.timeDuration}) : super(key: key);
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  List user = [];
  String points = '0';
  String caloriesBurned = '0';
  String hoursExercised = '0';
  
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
            appBar: buildAppBar(context, 'Success!'),
            backgroundColor: const Color.fromARGB(255, 228, 218, 218),
            //list view # maybe edit this to change the look
            body: ListView(
              physics: const BouncingScrollPhysics(),
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
              child: Text('Well Done!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            //Aligning the Icon & Latest Exercise
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  width: 24,
                ),
                Text(
                  'You earned 5 points!',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      );

      Future<void> updatePoints() async {
        final currUser = FirebaseAuth.instance.currentUser!.uid;
        QuerySnapshot query = await FirebaseFirestore.instance.collection('User').where('id', isEqualTo: currUser).get();

        final user = query.docs.map((doc)=> Users.fromJson(doc.data() as Map<String, dynamic>)).toList();
        points = (double.parse(user.first.points) + 5).toStringAsFixed(3);
        caloriesBurned = ((widget.timeDuration / 60) * (5 * 3.5 * int.parse(user.first.weight))/200).toStringAsFixed(3);
        hoursExercised = (double.parse(user.first.hours) + (widget.timeDuration) / 3600).toStringAsFixed(3);
        FirebaseFirestore.instance.collection('User').doc(currUser).update({'points': (points), 'last_exercise': DateTime.now(), 'calories': caloriesBurned, 'hours': hoursExercised});
      }
}