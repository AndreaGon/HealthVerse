

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/content_page/content_page.dart';

import '../../widget/appbar_widget.dart';

class Communities extends StatefulWidget {
  @override
  _CommunitiesState createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {

  final List dummyList = List.generate(50, (index) {
    return {
      "id": index,
      "title": "This is the title $index",
      "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. $index"
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloatingAddContent(context),
      appBar: buildAppBar(context, "Communities"),
      backgroundColor: Color(0xF4EEED),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) => buildPostCard(context, index),)
    ));
    
  }

  @override
  Widget buildPostCard(BuildContext context, int index){
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Colors.purple,
              ),
              title: Text(dummyList[index]["title"]),
              subtitle: Text(dummyList[index]["subtitle"])
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: buildButtons(context)
          )
        ]
      )
    );
  }

  @override
  Widget buildButtons(BuildContext context){
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.favorite_border)),
            Text("100"),
            const SizedBox(width: 8),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.comment)),
            Text("78"),
            const SizedBox(width: 8),
          ],
        )
    );
    
  }

  @override
  Widget buildFloatingAddContent(BuildContext context){
    return FloatingActionButton(
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContentPage()));
      },
      backgroundColor: Colors.purple,
      child: const Icon(
        Icons.edit,
        color: Colors.white
      )
    );
  }
}