import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/content_page/content_page.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../model/post.dart';
import '../../widget/appbar_widget.dart';

class Communities extends StatefulWidget {
  @override
  _CommunitiesState createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {

  List posts = [];
  
  @override
  Widget build(BuildContext context) {

    getData();

    return FutureBuilder<List>(
      future: getData(),
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
          if (snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'));
          }   
          else{
            posts = snapshot.data!;
            return Scaffold(
              floatingActionButton: buildFloatingAddContent(context),
              appBar: buildAppBar(context, 'Communities'),
              backgroundColor: const Color(0x00f4eeed),
              body: SafeArea(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) => buildPostCard(context, index),)
              )
            );
          }     
        }
      }
    );

    
  }

  Widget buildPostCard(BuildContext context, int index){
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.purple,
                child: Icon(Icons.person),
              ),
              title: Text(posts[index].username),
              subtitle: Text(posts[index].text)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: buildButtons(context, index)
          )
        ]
      )
    );
  }

  Widget buildButtons(BuildContext context, int index){
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              onPressed: (){
                likeItem(posts[index]);

              }, 
              icon: const Icon(Icons.favorite_border)),
            Text(posts[index].likes_number.toString()),
            const SizedBox(width: 8),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.comment)),
            Text(posts[index].comments_number),
            const SizedBox(width: 8),
          ],
        )
    );
    
  }

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


  Future<List> getData() async {
    QuerySnapshot query = await FirebaseFirestore.instance.collection('Postings').get();

    final allPostings = query.docs.map((doc)=> Post.fromJson(doc.data() as Map<String, dynamic>)).toList();

    return allPostings;
  }



  Future likeItem(Post post) async {
    print('Submtitting form');
    
    QuerySnapshot query = await FirebaseFirestore.instance.collection('Postings').where('id', isEqualTo: post.id).get();

    final posting = query.docs.map((doc)=> Post.fromJson(doc.data() as Map<String, dynamic>)).toList();
    int currentLikes = posting.first.likes_number;
    int newLike = currentLikes + 1;

    
    
    FirebaseFirestore.instance.collection('Postings').doc(post.id).update({'likes_number': newLike});
    setState(() {});
  }

}