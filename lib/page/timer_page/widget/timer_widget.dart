import 'package:flutter/material.dart';

class AddTimeValue extends StatelessWidget {
  final String time;
  final String min;
  final int value;

  const AddTimeValue(
      {super.key,
      required this.time,
      required this.min,
      required this.value,
      required Null Function() onTap});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {
          print(value);
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: const Color.fromARGB(255, 153, 155, 132),
            )),
<<<<<<< HEAD
            child: Text(time,
                style: TextStyle(color: Color.fromARGB(255, 255, 252, 252)))),
=======
            child: Text(time, style: const TextStyle(color: Colors.black))),
>>>>>>> 96aa69ce8ddf2087db6eeab2ae486231c9130ce7
      ),
      const SizedBox(
        height: 5,
      ),
      Text(min, style: const TextStyle(color: Colors.black))
    ]);
  }
}
