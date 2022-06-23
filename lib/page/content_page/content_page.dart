import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/communities/communities.dart';

import '../../model/post.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/navigation_widget.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
  
}

class _ContentPageState extends State<ContentPage>{
  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> postData = { 'text': "" };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Create New Post"),
      backgroundColor: Color(0xF4EEED),
      bottomNavigationBar: buildPostButton(context),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: buildTextArea(context),
        ),
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
              child: TextFormField(
                maxLines: 20, //or null 
                decoration: InputDecoration.collapsed(hintText: "Post your exercise achievements!"),
                onSaved: (String ?value) {
                  postData['text'] = value;
                },
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
            createNewPost();
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

  Future createNewPost() async {
    print("Submtitting form");
    formKey.currentState?.save();

    final docPost = FirebaseFirestore.instance.collection('Postings').doc();
  
    Post postJson = Post(
      comments_number: "0",
      likes_number: "0",
      text: postData['text'],
      userId: "0"
    );
    
    await docPost.set(postJson.toJson());
    Navigator.of(context).pop();
  }
}