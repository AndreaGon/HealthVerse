import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/timer_page/widget/timer_widget.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  bool isVisible = true;
  bool isNotVisible =false;
  String timeValue = '00:00:00';
  
  
  @override
  Widget build(BuildContext) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 238, 237),
        body: Container(
            child: Column(children: [
          Container(
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
              child: Text(timeValue,style: TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 153, 155, 132)))),
          Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AddTimeValue(
                    time: '+10', 
                    min: 'min', 
                    value: 10
                  ,),

                ),
                AddTimeValue(
                  time: '+5', 
                  min: 'min', 
                  value: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AddTimeValue(
                  time: '+15', 
                  min: 'sec',                   
                  value: 15,
                ),
            )])),
          Divider(
            color: Colors.black,
            thickness: 3,
          ),
          Container(alignment: Alignment.center,
              child: Stack(
                children: [
            Visibility(
              visible: isVisible,
              maintainSize: true, 
              maintainState: true,
              maintainAnimation: true,

              child: Center(
                child: FlatButton(
                    onPressed: (){
                      setState(( ){
                        isVisible = !isVisible;
                        isNotVisible = !isNotVisible;
                      });
                    },
                    
                    
                    child: Text('Start',
                        style: TextStyle(color: Colors.black, fontSize: 20))),
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
                  children: [FlatButton(
                     onPressed: (){
                      setState(( ){
                        isVisible = !isVisible;
                        isNotVisible = !isNotVisible;
                      });
                      timeValue = '00:00:00';
                    },
                    child: Text('Stop',
                        style: TextStyle(color: Colors.black, fontSize: 20))),
            
                   Row(
                    
                     children: [FlatButton(
                       onPressed: (){},
                       child: Text('Reset',
                           style: TextStyle(color: Colors.black, fontSize: 20)))
                     
                     ],
            
                     
            
                   )
                      ]),
              ),
            ),
        ]))
        ])));
  }
}


