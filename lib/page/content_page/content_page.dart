
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/model/users.dart';

import '../../model/post.dart';
import '../../widget/appbar_widget.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
  
}

class _ContentPageState extends State<ContentPage>{
  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> postData = { 'text': '' };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Create New Post'),
      backgroundColor: const Color(0x00f4eeed),
      bottomNavigationBar: buildPostButton(context),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: buildTextArea(context),
        ),
      ) 
     );

  }

  Widget buildTextArea(BuildContext context){
    return Column(
      children: <Widget>[
          Card(
            color: const Color.fromARGB(255, 214, 214, 214),
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                maxLines: 20, //or null 
                decoration: const InputDecoration.collapsed(hintText: 'Post your exercise achievements!'),
                onSaved: (String ?value) {
                  postData['text'] = value;
                },
              ),
            )
          )
      ],
    );
  }

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
    formKey.currentState?.save();
    final currUser = FirebaseAuth.instance.currentUser!.uid;
    final docPost = FirebaseFirestore.instance.collection('Postings').doc();
    QuerySnapshot query = await FirebaseFirestore.instance.collection('User').where('id', isEqualTo: currUser).get();

    final user = query.docs.map((doc)=> Users.fromJson(doc.data() as Map<String, dynamic>)).toList();

    Post postJson = Post(
      id: docPost.id,
      comments_number: '0',
      likes_number: 0,
      text: postData['text'],
      userId: currUser,
      username: user.first.name
    );
    
    await docPost.set(postJson.toJson());
    Navigator.of(context).pop();
  }
}