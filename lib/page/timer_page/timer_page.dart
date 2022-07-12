import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/success_page/success_page.dart';
import 'package:flutter_userprofile1/page/timer_page/widget/timer_widget.dart';
import 'package:flutter_userprofile1/widget/appbar_widget.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int duration = 0;
  bool isStopped = false;
  final CountDownController controller = CountDownController();
  
  
  @override
  Widget build(BuildContext) {
    return Scaffold(
        appBar: buildAppBar(context, "Goals"),
        backgroundColor: Color.fromARGB(255, 244, 238, 237),
        body: Column(
            children: [Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter, child: buildTimer(context),
                ),
                
              ],  
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  timerButtons(
                    title: "Add 10 min",
                    onPressed: () => {
                      duration += 600,
                      controller.restart(duration: duration),
                      controller.pause()
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  timerButtons(
                    title: "Add 5 min",
                    onPressed: () => {
                      duration += 300,
                      controller.restart(duration: duration),
                      controller.pause()
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),  
              ])
              ],),
          floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                timerButtons(
                  title: "Start",
                  onPressed: () => controller.restart(duration: duration),
                ),
                const SizedBox(
                  width: 10,
                ),
                timerButtons(
                  title: "Pause",
                  onPressed: () => controller.pause(),
                ),
                const SizedBox(
                  width: 10,
                ),
                timerButtons(
                  title: "Resume",
                  onPressed: () => controller.resume(),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          );
        
  }

  Widget buildTimer(BuildContext context){
    return CircularCountDownTimer(
              duration: duration,
              controller: controller,
              fillColor: Color.fromARGB(255, 153, 155, 132), 
              height: MediaQuery.of(context).size.height / 2, 
              ringColor: Color.fromARGB(255, 243, 253, 134), 
              width: MediaQuery.of(context).size.width / 2,
              isReverse: true,
              isReverseAnimation: true,
              isTimerTextShown: true,
              autoStart: false,
              textStyle: TextStyle(
              fontSize: 33.0, color: Color.fromARGB(255, 153, 155, 132), fontWeight: FontWeight.bold),
              textFormat: CountdownTextFormat.HH_MM_SS,
              onComplete: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SuccessPage(timeDuration: duration)));
              },);
  }

  Widget addTimerValueButtons({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color.fromARGB(116, 115, 150, 74)),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget timerButtons({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color.fromARGB(116, 115, 150, 74)),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

}


