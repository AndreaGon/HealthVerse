import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTimeValue extends StatelessWidget {
  final String time;
  final String min;
  final int value;

  const AddTimeValue(
      {super.key, required this.time, required this.min, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: (){
          print(this.value);
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Color.fromARGB(255, 153, 155, 132),
            )),
            child: Text(time, style: TextStyle(color: Colors.black))),
      ),
      SizedBox(
        height: 5,
      ),
      Text(min, style: TextStyle(color: Colors.black))
    ]);
  }
}
