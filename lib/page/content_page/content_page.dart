import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/appbar_widget.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
  
}

class _ContentPageState extends State<ContentPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Create New Post"),
      backgroundColor: Color(0xF4EEED),
      bottomNavigationBar: buildPostButton(context),
      body: SafeArea(
        child: buildTextArea(context),
      ) 
     );

  }

  @override
  Widget buildTextArea(BuildContext context){
    return Column(
      children: <Widget>[
          Card(
            color: Color.fromARGB(255, 214, 214, 214),
            margin: EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                maxLines: 20, //or null 
                decoration: InputDecoration.collapsed(hintText: "Post your exercise achievements!"),
              ),
            )
          )
      ],
    );
  }

  @override
  Widget buildPostButton(BuildContext context){
    return Material(
      color: Colors.purple,
      child: InkWell(
          onTap: () {
            //print('called on tap');
          },
          child: const SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                'Post Update',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          )
        ),
    );
  }
}