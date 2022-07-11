import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/timer_page/widget/timer_widget.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  bool isVisible = true;
  bool isNotVisible = false;
  TimerController _timerController;

  void initState() {
    super.initState();
    _timerController = TimerController(this);
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 238, 237),
        body: Container(
            padding: EdgeInsets.all(30),
            child: Column(children: [
              Expanded(
                flex: 6,
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromARGB(255, 153, 155, 132),
                        width: 2,
                      )),
                      child: SimpleTimer(
                        duration: Duration(minutes: 1)),
                        backgroundColor: Colors.black,
                        progressTextStyle: TextStyle(
                          background: color: Colors.black, 
                          fontSize:50, strokeWidth: 10,) 
                          
                ),
                
              ),
              Expanded(
                flex: 2,
                child: Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: AddTimeValue(
                              time: '+20',
                              min: 'min',
                              value: 10,
                              onTap: () {
                                setState(() {
                                  _timerController.add(Duration (seconds: 20) start: true);
                                });
                              },
                            ),
                          ),
                          AddTimeValue(
                              time: '+10',
                              min: 'min',
                              value: 5,
                              onTap: () {
                                setState(() {
                                  _timerController.add(Duration (seconds: 10) start: true);
                                });
                              }),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: AddTimeValue(
                                time: '+5',
                                min: 'sec',
                                value: 15,
                                onTap: () {
                                  setState(() {
                                    _timerController.add(Duration (seconds: 5) start: true);
                                  });
                                }),
                          )
                        ])),
              ),
              Divider(
                color: Color.fromARGB(255, 252, 249, 249),
                thickness: 3,
              ),
              Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.center,
                    child: Stack(children: [
                      Visibility(
                        visible: isVisible,
                        maintainSize: true,
                        maintainState: true,
                        maintainAnimation: true,
                        child: Center(
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                  isNotVisible = !isNotVisible;
                                  _timerController.start();
                                });
                              },
                              child: Text('Start',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20))),
                        ),
                      ),
                      Visibility(
                        maintainSize: true,
                        maintainState: true,
                        maintainAnimation: true,
                        visible: isNotVisible,
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                        isNotVisible = !isNotVisible;
                                        _timerController.stop();
                                      });
                                      timeValue = '00:00:00';
                                    },
                                    child: Text('Stop',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20))),
                                Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                        isVisible = !isVisible;
                                        isNotVisible = !isNotVisible;
                                        _timerController.reset();
                                      });
                                        },
                                        child: Text('Reset',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)))
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ])),
              )
            ])));
  }
  
  SimpleTimer({required Duration duration}) {}
}
